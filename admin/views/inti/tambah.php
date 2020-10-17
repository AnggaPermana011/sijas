<h4>Tambah Data</h4>
<hr>
<form action="index.php?mod=inti&page=save" method="POST">
    <div class="col-lg-6">
    <div class="form-group">
        <label for="">Nama Penyedia</label>
        <input type="text" name="nama_penyedia" required value="<?=(isset($_POST['nama_penyedia']))?$_POST['nama_penyedia']:'';?>" class="form-control">
        <input type="hidden" name="id_penyedia"  value="<?=(isset($_POST['id_penyedia']))?$_POST['id_penyedia']:'';?>" class="form-control">
        <span class="text-danger"><?=(isset($err['nama_penyedia']))?$err['nama_penyedia']:'';?></span>
    </div>
    <div class="form-group">
        <label for="">No HP</label>
        <input type="number" name="no_hp" value="<?=(isset($_POST['no_hp']))?$_POST['no_hp']:'';?>" class="form-control">
        <span class="text-danger"><?=(isset($err['no_hp']))?$err['no_hp']:'';?></span>
    </div>
    <div class="form-group">
        <label for="">Alamat</label>
        <input type="text" name="alamat" required value="<?=(isset($_POST['alamat']))?$_POST['alamat']:'';?>" class="form-control">
        <span class="text-danger"><?=(isset($err['alamat']))?$err['alamat']:'';?></span>
    </div>
    <div class="form-group">
        <label for="">Jasa</label>
        <select name="id_jasa" class="form-control" required id="">
            <option value="">Pilih Jasa</option>
            <?php if($jasa != NULL){
                foreach($jasa as $row){?>
                    <option <?=(isset($_POST['id_jasa']) && $_POST['id_jasa']==$row['id_jasa'])?"selected":'';?> value="<?=$row['id_jasa'];?>"> <?=$row['nama_jasa'];?></option>
                <?php }
            }?>
        </select>
        <span class="text-danger"><?=(isset($err['id_jasa']))?$err['id_jasa']:'';?></span>
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Simpan</button>
    </div>
    </div>
</form>