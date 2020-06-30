lsblk
# NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
# xvda    202:0    0    8G  0 disk
# └─xvda1 202:1    0    8G  0 part /
# xvdf    202:80   0    2G  0 disk
sudo file -s /dev/xvdf
# /dev/xvdf: data
sudo mkfs.xfs /dev/xvdf
# meta-data=/dev/xvdf              isize=512    agcount=4, agsize=131072 blks
#          =                       sectsz=512   attr=2, projid32bit=1
#          =                       crc=1        finobt=1, sparse=1, rmapbt=0
#          =                       reflink=1
# data     =                       bsize=4096   blocks=524288, imaxpct=25
#          =                       sunit=0      swidth=0 blks
# naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
# log      =internal log           bsize=4096   blocks=2560, version=2
#          =                       sectsz=512   sunit=0 blks, lazy-count=1
# realtime =none                   extsz=4096   blocks=0, rtextents=0
sudo file -s /dev/xvdf
# /dev/xvdf: SGI XFS filesystem data (blksz 4096, inosz 512, v2 dirs)
sudo mkdir /data
sudo mount /dev/xvdf /data
lsblk
# NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
# xvda    202:0    0    8G  0 disk
# └─xvda1 202:1    0    8G  0 part /
# xvdf    202:80   0    2G  0 disk /data
sudo cp /etc/fstab /etc/fstab.backup
blkid
# /dev/xvda1: LABEL="cloudimg-rootfs" UUID="fdd49fba-0340-4ed1-b0fc-8da187913fec" TYPE="ext4" PARTUUID="093eb684-01"
# /dev/xvdf: UUID="c4b1513c-f189-4a91-b0ce-26ca0abd3bd8" TYPE="xfs"
sudo vim /etc/fstab
# LABEL=cloudimg-rootfs	/	 ext4	defaults,discard	0 0
# UUID="c4b1513c-f189-4a91-b0ce-26ca0abd3bd8" /data xfs defaults,nofail 0 2
sudo umount /data
lsblk
# NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
# xvda    202:0    0    8G  0 disk
# └─xvda1 202:1    0    8G  0 part /
# xvdf    202:80   0    2G  0 disk
sudo mount -a
lsblk
# NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
# xvda    202:0    0    8G  0 disk
# └─xvda1 202:1    0    8G  0 part /
# xvdf    202:80   0    2G  0 disk /data
sudo chmod o+w /data
echo test > test.txt

# Новый инстанс
lsblk
# NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
# xvda    202:0    0    8G  0 disk
# └─xvda1 202:1    0    8G  0 part /
# xvdf    202:80   0    2G  0 disk
sudo file -s /dev/xvdf
# /dev/xvdf: SGI XFS filesystem data (blksz 4096, inosz 512, v2 dirs)
sudo mkdir /data
sudo mount /dev/xvdf /data
cd /data
ls
# test.txt
cat test.txt
# test

