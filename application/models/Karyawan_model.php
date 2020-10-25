<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Karyawan_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function getAllDataKaryawan()
    {
        return $this->db->get('data_karyawan')->result();
    }

    public function getDataKaryawanById($id)
    {
        return $this->db->get_where('data_karyawan', array('id' => $id))->result();
    }

    public function getDataKaryawanByNik($nik)
    {
        return $this->db->get_where('data_karyawan', array('nik' => $nik))->result();
    }

    public function getAbsensiKaryawanById($id)
    {
        return $this->db->get_where('absensi_karyawan', array('id' => $id))->result();
    }

    public function getAbsensiKaryawanByName($name)
    {
        return $this->db->get_where('absensi_karyawan', array('nama' => $name))->result();
    }

    public function getAlasanKaryawanByName($name)
    {
        return $this->db->order_by('id', 'DESC')->get_where('alasan_karyawan', array('nama' => $name))->result();
    }

    public function changeInfoKaryawanById($id, $data)
    {
        return $this->db->set($data)->where('id', $id)->update('data_karyawan');
    }

    public function addDataKaryawan($data)
    {
        return $this->db->insert('data_karyawan', $data);
    }

    public function addAbsensiKaryawan($data)
    {
        return $this->db->insert('absensi_karyawan', $data);
    }

    public function updateAbsensiKaryawan($id, $kehadiran, $option, $jumlah)
    {
        return $this->db->set($kehadiran, $kehadiran . $option . $jumlah, FALSE)->where('id', $id)->update('absensi_karyawan');
    }

    public function addAlasanKaryawan($name, $alasan, $date)
    {
        return $this->db->insert('alasan_karyawan', array('nama' => $name, 'alasan' => $alasan, 'tanggal' => $date));
    }

    public function resetAbsen()
    {
        return $this->db->set('absen', '0', FALSE)->update('absensi_karyawan');
    }

    public function deleteKaryawan($id)
    {
        return $this->db->delete('data_karyawan', array('id' => $id));
    }

    public function loginKaryawan($nik, $password)
    {
        return $this->db->where('nik', $nik)->where('password', $password)->get('users_karyawan')->result();
    }

    public function addUserKaryawan($nik, $password)
    {
        return $this->db->insert('users_karyawan', array('nik' => $nik, 'password' => $password, 'level' => 'Karyawan'));
    }

    public function settingAbsensi($start, $end)
    {
        return $this->db->set('mulai_absen', $start)->set('selesai_absen', $end)->update('setting_absensi');
    }

    public function getSettingAbsensi()
    {
        return $this->db->get('setting_absensi')->result();
    }

    public function absenHarian($id)
    {
        return $this->db->set('absen', '1')->where('id', $id)->update('absensi_karyawan');
    }

    public function addHistory($name, $info, $tanggal)
    {
        return $this->db->insert('history_karyawan', array('nama' => $name, 'info' => $info, 'tanggal' => $tanggal));
    }

    public function uploadImage()
    {
        $config['upload_path'] = './images/';
        $config['allowed_types'] = 'jpg|png|jpeg';
        $config['max_size'] = '2048';
        $config['remove_space'] = TRUE;
        $this->load->library('upload', $config);
        if ($this->upload->do_upload('upload_image')) {
            return array('result' => 'success', 'file' => $this->upload->data(), 'error' => '');
        } else {
            return array('result' => 'failed', 'file' => '', 'error' => $this->upload->display_errors());
        }
    }

    //MENCARI ID_KARYAWAN DARI RFID YANG DIMASUKKAN
    public function getIdByRfid($rfid)
    {
        return $this->db->get_where('rfid_karyawan', array('kode_rfid' => $rfid))->result();
    }

    public function cekAbsenMasuk($tanggal)
    {
        return $this->db->get_where('absen_karyawan', array('tanggal' => $tanggal))->result();
    }

    //API UNTUK ABSEN KERJA SAAT MASUK KERJA
    public function absenMasuk($id_karyawan,$jam_masuk,$keterlambatan,$tanggal)
    {
        $data = array(
            'id_karyawan' => $id_karyawan,
            'jam_masuk' => $jam_masuk,
            'terlambat' => $keterlambatan,
            'tanggal' => $tanggal
        );
        $this->db->insert('absen_karyawan', $data);
    }

    //API UNTUK ABSEN KERJA SAAT PULANG KERJA
    public function absenPulang($id_karyawan, $tanggal,$jam_pulang, $lembur)
    {
        $data = array(
            'jam_keluar' => $jam_pulang,
            'lembur' => $lembur,
            'jam_kerja'=>8
        );
        $this->db->where('id_karyawan', $id_karyawan)->where('tanggal', $tanggal);
        $this->db->update('absen_karyawan', $data);
    }

    //API UNTUK MENGHITUNG JUMLAH GAJI
    public function getHitungGaji($id_karyawan,$varbulan,$vartahun){
        $this->db->select_sum('jam_kerja');
        $this->db->select_sum('terlambat');
        $this->db->select_sum('lembur');
        $this->db->from('absen_karyawan');
        $this->db->where('month(tanggal)',$varbulan);
        $this->db->where('year(tanggal)',$vartahun);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result();
            } else {
            return false;
        }
    }
}
