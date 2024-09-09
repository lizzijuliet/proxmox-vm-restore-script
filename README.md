## Script de Restauración de VM

Este script está diseñado para restaurar una máquina virtual en Proxmox desde un archivo de backup. El script realiza las siguientes acciones:

1. Verifica la existencia del archivo de backup.
2. Elimina la VM existente si ya está en ejecución.
3. Restaura la VM desde el archivo de backup.

### Uso

1. **Configura el Script**: Modifica las variables en el script `restore_vm.sh` para que se ajusten a tu entorno.

2. **Dale Permisos de Ejecución**: Asegúrate de que el script tiene permisos de ejecución en el host de Proxmox:
   ```sh
   chmod +x restore_vm.sh

3. **Ejecuta el Script**:
   ```sh
   ./restore_vm.sh

### Requisitos
Acceso a un servidor Proxmox.
Comandos qm disponibles en el sistema.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
