function ssh_bgi_config
ssh -N -f -L 2024:cngb-xcompute-f02-31:22 zhujie@192.168.60.6
echo "ssh -N -f -L 2024:cngb-xcompute-f02-31:22 zhujie@192.168.60.6 sucess"
ssh -N -f -L 2020:cngb-oxcompute-6:22 zhujie@10.225.3.7
echo "ssh -N -f -L 2020:cngb-oxcompute-6:22 zhujie@10.225.3.7 sucess"
ssh -N -f -L 9966:localhost:9966 zhujie@10.225.3.7
echo "ssh -N -f -L 9966:localhost:9966 zhujie@10.225.3.7 sucess"
ssh -N -f -L 2080:localhost:2080 zhujie@192.168.60.6
echo "ssh -N -f -L 2080:localhost:2080 zhujie@192.168.60.6 sucess"
end
