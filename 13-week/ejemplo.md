# Atributos de Auditoría (Generales para todas las Entidades)

Estos atributos se aplican a todas las entidades para el control y trazabilidad de las mismas:

- **`id`**: Unique identifier for the entity
- **`status`**: Status of the entity (active, inactive)
- **`created_at`**: Timestamp of when the entity was created
- **`updated_at`**: Timestamp of when the entity was last updated
- **`deleted_at`**: Timestamp of when the entity was deleted (if applicable)
- **`created_by`**: User ID who created the entity
- **`updated_by`**: User ID who last updated the entity
- **`deleted_by`**: User ID who deleted the entity (if applicable)

---

# Atributos Específicos por Entidad

## 1. Person
   - **`first_name`**: First name of the person
   - **`last_name`**: Last name of the person
   - **`middle_name`**: Middle name of the person (optional)
   - **`email`**: Email address of the person
   - **`phone`**: Phone number of the person
   - **`address`**: Address of the person (optional)
   - **`gender`**: Gender of the person (optional)
   - **`date_of_birth`**: Date of birth of the person
   - **`national_id`**: National identification number (optional)
   - **`profile_picture`**: URL or path to the person's profile picture (optional)
   - **`marital_status`**: Marital status (single, married, divorced, etc.)
   - **`social_security_number`**: Social security number (optional)

## 2. User
   - **`person_id`**: Foreign key referring to the `Person` entity
   - **`username`**: Username for the user
   - **`password`**: Password for the user (hashed)

## 3. Role
   - **`code`**: Code representing the role (optional)
   - **`name`**: Name of the role
   - **`description`**: Description of the role

## 4. Role_User
   - **`user_id`**: Foreign key referring to the `User` entity
   - **`role_id`**: Foreign key referring to the `Role` entity

## 5. Module
   - **`code`**: Code representing the module
   - **`name`**: Name of the module
   - **`description`**: Description of the module
   - **`path`**: Path or URL related to the module (optional)

## 6. Module_Role
   - **`module_id`**: Foreign key referring to the `Module` entity
   - **`role_id`**: Foreign key referring to the `Role` entity

## 7. Form
   - **`code`**: Code representing the form
   - **`name`**: Name of the form
   - **`description`**: Description of the form
   - **`path`**: Path or URL related to the form (optional)

## 8. Form_Module
   - **`form_id`**: Foreign key referring to the `Form` entity
   - **`module_id`**: Foreign key referring to the `Module` entity

---