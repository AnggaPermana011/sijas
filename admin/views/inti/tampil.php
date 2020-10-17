<div class="row">
    <div class="pull-left">
        <h4>Daftar Penyedia Jasa</h4>
    </div>
    <div class="pull-right">
        <a href="index.php?mod=inti&page=add">
            <button class="btn btn-primary">Add</button>
        </a>
    </div>
</div>
<div class="row">
    <table class="table">
        <thead>
            <tr>
                <td>
                    #
                </td>
                <td>Nama</td><td>No HP</td><td>Alamat</td><th>Jasa</th><th>Harga</th><td>Aksi</td>
            </tr>
        </thead>
        <tbody>
            <?php if($penyedia != NULL){ 
                $no=1;
                foreach($penyedia as $row){?>
                    <tr>
                        <td><?=$no;?></td><td><?=$row['nama']?></td><td><?=$row['no_hp'];?></td><td><?=$row['alamat']?></td>
                        <td><?=$row['nama_jasa']?></td><td><?=$row['biaya']?></td>                        
                        <td>
                            <a href="index.php?mod=inti&page=edit&id=<?=md5($row['id_penyedia'])?>"><i class="fa fa-pencil"></i> </a>
                            <a href="index.php?mod=inti&page=delete&id=<?=md5($row['id_penyedia'])?>"><i class="fa fa-trash"></i> </a>
                        </td>
                    </tr>
               <?php $no++; }
            }?>
        </tbody>
    </table>
</div>