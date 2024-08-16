#!/bin/bash

# Variables
BACKUP_PATH="/mnt/pve/xxx/dump/vzdump-qemu-102-xxvma.zst"  # Ruta al archivo de backup
VM_ID="102"  # ID de la máquina virtual a restaurar
STORAGE="STGxxx"  # Nombre del almacenamiento en Proxmox donde se restaurará la VM

# Verifica si el archivo de backup existe
if [ ! -f "$BACKUP_PATH" ]; then
  echo "Error: El archivo de backup no existe en la ruta especificada: $BACKUP_PATH"
  exit 1
fi

# Verifica si la VM ya existe y elimínala si es necesario
if qm status "$VM_ID" &> /dev/null; then
  echo "La máquina virtual con ID $VM_ID ya existe. Eliminándola..."
  qm stop "$VM_ID"
  qm destroy "$VM_ID"
  if [ $? -ne 0 ]; then
    echo "Error: No se pudo eliminar la máquina virtual existente."
    exit 1
  fi
fi

# Restaura el backup
qmrestore "$BACKUP_PATH" "$VM_ID" --storage "$STORAGE"

# Verifica si la restauración fue exitosa
if [ $? -eq 0 ]; then
  echo "La máquina virtual ha sido restaurada exitosamente."
else
  echo "Error: La restauración de la máquina virtual ha fallado."
  exit 1
fi