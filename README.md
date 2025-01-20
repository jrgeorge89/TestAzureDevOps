# TechTest - CI/CD Pipeline con Terraform y Azure

## Descripción del Proyecto

Este proyecto tiene como objetivo configurar un pipeline CI/CD utilizando Azure DevOps y Terraform para desplegar una infraestructura en Azure. La infraestructura incluye la creación de un grupo de recursos, una cuenta de almacenamiento, un contenedor de almacenamiento y la carga de un archivo `index.html` en Azure Blob Storage.

## Instrucciones para Ejecutar el Pipeline

Sigue estos pasos para ejecutar el pipeline y desplegar la infraestructura:

### Paso 1: Crear un Service Principal en Azure

1. **Inicia sesión en Azure CLI**:

   ```bash
   az login
   ```

2. **Crea un Service Principal**

   ```bash
   az ad sp create-for-rbac --name "techtest-service-principal" --role contributor --scopes /subscriptions/<tu-subscription-id>
   ```

3. **Guarda los valores de appId, password y tenant proporcionados por el comando anterior**


### Paso 2: Configurar el Proyecto en Azure DevOps

1. **Crear un Nuevo Proyecto en Azure DevOps:**:

    * Inicia sesión en Azure DevOps.
    * Haz clic en "Nuevo proyecto" y sigue las instrucciones para crear un nuevo proyecto llamado "TechTest".

2. **Inicializar un Repositorio Git:**:

    * Ve a la sección "Repos" en Azure DevOps.
    * Selecciona "Initialize" para crear un repositorio vacío.
    * Clona el repositorio en tu máquina local.

3. **Cargar los Archivos al Repositorio:**:

    * Copia los archivos main.tf, variables.tf, terraform.tfvars, index.html, .gitignore y azure-pipelines.yml al directorio del repositorio clonado.

    * Añade y confirma los archivos:

        ```bash
        git add .
        git commit -m "Confirmación inicial con configuración de Terraform y YAML"
        ```
    
    * Empuja los cambios al repositorio remoto:

        ```bash
        git push origin main
        ```

### Paso 3: Crear y Configurar el Pipeline CI/CD

1. **Crear un Nuevo Pipeline:**:

    * Navega a la sección "Pipelines" en Azure DevOps.
    * Haz clic en "New Pipeline" y selecciona el repositorio que inicializaste.

2. **Configurar el Pipeline con YAML:**:

    * Selecciona "YAML" y especifica la ruta del archivo azure-pipelines.yml.
    * Guarda y ejecuta el pipeline.

3. **Configurar Variables Secretas:**:

    * Edita el pipeline y añade las siguientes variables secretas:
        - azureServicePrincipalId
        - azureServicePrincipalPassword
        - azureTenantId
        - azureSubscriptionId

    * Marca la opción "Keep this value secret" para cada una.

4. **Configurar Variables Secretas (terraform.tfvars):**:

    * Dirígete a Library, da click en “Secure files” y cargas el archivo “terraform.tfvars” de esta forma quedaran agregadas las variables restantes de manera segura.
        - resource_group_name
        - storage_account_name
        - container_name
        - location


### Paso 4: Ejecutar el Pipeline y Validar

1. **Ejecutar el Pipeline:**:

    * Ejecuta el pipeline desde Azure DevOps y observa cómo se despliega la infraestructura.

2. **Validar el Despliegue:**:

    * Verifica en el portal de Azure que el grupo de recursos, la cuenta de almacenamiento y el contenedor de Blob Storage se hayan creado correctamente.
    * Asegúrate de que el archivo index.html esté presente en el contenedor de Blob Storage.



## Decisiones Técnicas

La implementación de la infraestructura en Azure Devops con Terraform tiene muchas variables que se pueden considerar para obtener el mejor rendimiento en los procesos que se ejecutan, pero adicional a esto se tuvo a consideración algunas buenas prácticas al momento de configurar los archivos como son:


### Separación de Etapas "Plan" y "Apply"

Para este proyecto, decidí separar las etapas de "Plan" y "Apply" en el pipeline CI/CD. Esta separación proporciona una mayor visibilidad y control sobre los cambios que se van a aplicar a la infraestructura. La etapa "Plan" genera un archivo de plan (tfplan) que muestra los cambios propuestos, mientras que la etapa "Apply" aplica esos cambios.


### Uso de Variables Secretas

Para asegurar la seguridad de las credenciales, se utilizan variables secretas en Azure DevOps en lugar de incluirlas directamente en el archivo azure-pipelines.yml. Esto ayuda a proteger la información sensible y evita su exposición en el repositorio de código.


### Infraestructura Desplegada

La infraestructura desplegada incluye:

**Grupo de Recursos:**: techtest-resources
**Cuenta de Almacenamiento:**: techteststoracc
**Contenedor de Almacenamiento:**: content
**Blob Storage:**: index.html
