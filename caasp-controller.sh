INSTALL_IMG="SUSE-CaaS-Platform-1.0-DVD-x86_64-Beta3-DVD1.iso"
OS_VARIANT="caasp"
BASE_NAME="caasp-controller"

NOW=$(date '+%Y-%m-%d_%H-%M-%S')
VM_NAME="${BASE_NAME}_${NOW}"
NET_NAME="caasp"

OS_TYPE="Linux"
RAM="1024"
VCPUS="1"

DISK_IMG="${VM_NAME}_disk.qcow2"
DISK_SIZE="20G"
EXTRA_ARGS="hostname=${BASE_NAME} netdevice=eth0"

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
    --extra-args "${EXTRA_ARGS}"
