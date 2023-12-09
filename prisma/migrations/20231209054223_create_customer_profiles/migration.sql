/*
  Warnings:

  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE `users` DROP PRIMARY KEY,
    MODIFY `id` BIGINT NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- CreateTable
CREATE TABLE `customer_profiles` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `cus_name` VARCHAR(50) NOT NULL,
    `cus_add` VARCHAR(100) NOT NULL,
    `cus_city` VARCHAR(50) NOT NULL,
    `cus_state` VARCHAR(50) NOT NULL,
    `cus_postcode` VARCHAR(50) NOT NULL,
    `cus_country` VARCHAR(50) NOT NULL,
    `cus_phone` VARCHAR(50) NOT NULL,
    `cus_fax` VARCHAR(50) NOT NULL,
    `ship_name` VARCHAR(50) NOT NULL,
    `ship_add` VARCHAR(100) NOT NULL,
    `ship_city` VARCHAR(50) NOT NULL,
    `ship_state` VARCHAR(50) NOT NULL,
    `ship_postcode` VARCHAR(50) NOT NULL,
    `ship_country` VARCHAR(50) NOT NULL,
    `ship_phone` VARCHAR(50) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `customer_profiles_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `customer_profiles` ADD CONSTRAINT `customer_profiles_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
