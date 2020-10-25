<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('Karyawan_model', 'karyawan');
        if ($this->session->userdata('nik') == null) {
            redirect(base_url() . 'auth/login');
        }
    }

    public function messageAlert($type, $title)
    {
        $messageAlert = "
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 5000
        });
    
        Toast.fire({
            type: '" . $type . "',
            title: '" . $title . "'
        });
        ";
        return $messageAlert;
    }

    public function index()
    {
        $addHistory = $this->karyawan->addHistory($this->session->userdata('name'), $this->session->userdata('name') . ' Telah melakukan login', date('d/m/Y H:i:s'));
        $dataKaryawan = $this->karyawan->getDataKaryawanById($this->session->userdata('id'));
        $data['dataKaryawan'] = $dataKaryawan;
        $data['settingAbsensi'] = $getSettingAbsensi = $this->karyawan->getSettingAbsensi();
        $data['absensiKaryawan'] = $this->karyawan->getAbsensiKaryawanById($this->session->userdata('id'));
        $data['alasanKaryawan'] = $this->karyawan->getAlasanKaryawanByName($this->session->userdata('name'));
        $this->load->view('user/Dashboard', $data);
    }

    public function absenKaryawan()
    {
        $id = $this->uri->segment('3');
        $cekId = $this->karyawan->getDataKaryawanById($id);
        if ($cekId[0]->id) {
            $getSettingAbsensi = $this->karyawan->getSettingAbsensi();
            $start = $getSettingAbsensi[0]->mulai_absen;
            $end = $getSettingAbsensi[0]->selesai_absen;
            if (!(strtotime($start) <= time())) {
                $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'Waktu untuk absen belum di mulai'));
                redirect(base_url() . 'user');
            } elseif (!(time() >= strtotime($end))) {
                $absensiKaryawan = $this->karyawan->getAbsensiKaryawanById($id);
                if ($absensiKaryawan[0]->absen == 1) {
                    $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'Sudah absen'));
                    redirect(base_url() . 'user');
                } else {
                    $absenHarian = $this->karyawan->absenHarian($id);
                    $tambahKehadiran = $this->karyawan->updateAbsensiKaryawan($id, 'hadir', '+', '1');
                    $tambahHistory = $this->karyawan->addHistory($cekId[0]->name, $cekId[0]->name . ' telah melakukan absen', date('d/m/Y H:i:s'));
                    if ($absenHarian && $tambahKehadiran && $tambahHistory) {
                        $this->session->set_flashdata('messageAlert', $this->messageAlert('success', 'Absen berhasil'));
                        redirect(base_url() . 'user');
                    } else {
                        $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'Gagal untuk absen'));
                        redirect(base_url() . 'user');
                    }
                }
            } else {
                $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'Batas waktu untuk absen telah berakhir'));
                redirect(base_url() . 'user');
            }
        } else {
            $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'Gagal untuk absen'));
            redirect(base_url() . 'user');
        }
    }


    public function absenMasukKaryawan()
    {
        date_default_timezone_set('Asia/Jakarta');
        $from = strtotime("8:00:00");
        $to = strtotime(date('H:i:s'));
        $keterlambatan = round(($to - $from)/3600,0);
        //CEK APAKAH KARYAWAN TERLAMBAT ATAU TIDAK
        if($keterlambatan<0)$keterlambatan = 0;
        $tanggal = date('Y-m-d');
        $jam_masuk = date('H:i:s');
        $cekMasuk = $this->karyawan->cekAbsenMasuk($tanggal);
        //CEK APAKAH SUDAH PERNAH ABSEN APA BELUM
        if($cekMasuk){
            $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'Sudah Absen'));
            redirect(base_url() . 'user');
        }
        else{
            $rfid = "12345";
            $cek_id = $this->karyawan->getIdByRfid($rfid);
            //CEK RFID TERDAFTAR ATAU TIDAK 
            if($cek_id){
                $this->karyawan->absenMasuk($cek_id[0]->id_karyawan,$jam_masuk,$keterlambatan,$tanggal);
                $this->session->set_flashdata('messageAlert', $this->messageAlert('success', 'Absen berhasil'));
                redirect(base_url() . 'user');
        }
        else{
            $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'RFID tidak terdaftar'));
        }
        
        }
        
    }

    public function absenKeluarKaryawan()
    {
        date_default_timezone_set('Asia/Jakarta');
        $from = strtotime(date('H:i:s'));
        $to = strtotime("17:00:00");
        $lembur = round(($from - $to)/3600,0);
        $tanggal = date('Y-m-d');
        $jam_pulang = date('H:i:s');
        if($lembur<0)$lembur = 0;
        $rfid = "12345";
        $cek_id = $this->karyawan->getIdByRfid($rfid);
        //CEK RFID TERDAFTAR ATAU TIDAK 
        if($cek_id){
            $cekMasuk = $this->karyawan->cekAbsenMasuk($tanggal);
            if($cekMasuk){
                $this->karyawan->absenPulang($cek_id[0]->id_karyawan,$tanggal,$jam_pulang,$lembur);
                $this->session->set_flashdata('messageAlert', $this->messageAlert('success', 'Absen berhasil'));
                redirect(base_url() . 'user');
            }
            else{
                $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'belum Absen Masuk'));
            }
        }
        else{
            $this->session->set_flashdata('messageAlert', $this->messageAlert('error', 'RFID tidak terdaftar'));
        }
    }

    public function hitungGajiKaryawan(){
        $varBulan = date('m', strtotime('first day of last month'));
        $varTahun = date('Y', strtotime('first day of last month'));
        $id_karyawan = $this->session->userdata('id');
        $gaji_pokok = $this->karyawan->getHitungGaji($id_karyawan,$varBulan,$varTahun);
        $gaji_pokok['gaji_pokok'] = $gaji_pokok[0]->jam_kerja*90000;
        $gaji_pokok['terlambat'] = $gaji_pokok[0]->terlambat*10000;
        $gaji_pokok['lembur'] = $gaji_pokok[0]->lembur*30000;
        $gaji_pokok['total_gaji'] = $gaji_pokok['gaji_pokok']-$gaji_pokok['terlambat']+$gaji_pokok['lembur'] = $gaji_pokok[0]->lembur*30000;
        // echo ($gaji_pokok);
        $this->load->view('user/DashboardGaji',$gaji_pokok);
    }

    public function logout()
    {
        $this->session->sess_destroy();
        redirect(base_url());
    }


}
