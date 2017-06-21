INSTALL_IMG="SUSE-CaaS-Platform-1.0-DVD-x86_64-RC1-DVD1.iso"
OS_VARIANT="caasp"
BASE_NAME="caasp-worker-1"

NOW=$(date '+%Y-%m-%d_%H-%M-%S')
VM_NAME="${BASE_NAME}_${NOW}"
NET_NAME="caasp"

OS_TYPE="Linux"
RAM="1024"
VCPUS="1"

DISK_IMG="${VM_NAME}_disk.qcow2"
DISK_SIZE="40G"
EXTRA_ARGS="autoyast=file:///${BASE_NAME}_autoyast.xml hostname=${BASE_NAME} netdevice=eth0 netsetup=dhcp"

qemu-img create -f qcow2 ${DISK_IMG} ${DISK_SIZE}

virt-install \
    --debug \
    --name ${VM_NAME} \
    --os-type=${OS_TYPE} \
    --os-variant=${OS_VARIANT} \
    --ram=${RAM} \
    --vcpus=${VCPUS} \
    --disk path=${DISK_IMG},device=disk \
    --graphics vnc,listen=0.0.0.0 \
    --location ${INSTALL_IMG} \
    --network=network=${NET_NAME} \
    --initrd-inject "${BASE_NAME}_autoyast.xml" \
    --extra-args "${EXTRA_ARGS}"
