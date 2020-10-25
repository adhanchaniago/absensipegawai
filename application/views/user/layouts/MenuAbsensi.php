<div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            <h5 class="card-header bg-dark text-white">Menu Absensi Karyawan</h5>
            <div class="card-body">
                <form method="POST" action="<?php echo base_url(); ?>user/absenMasuk" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="id" class="col-form-label">ID_karyawan</label>
                        <input id="id" name="name" type="text" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary">Tambah</button>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</div>