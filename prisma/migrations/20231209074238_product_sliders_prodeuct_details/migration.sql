/*
  Warnings:

  - Added the required column `price` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `products` ADD COLUMN `price` VARCHAR(20) NOT NULL;

-- CreateTable
CREATE TABLE `product_sliders` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `short_desc` VARCHAR(100) NOT NULL,
    `price` VARCHAR(20) NOT NULL,
    `image` VARCHAR(191) NOT NULL,
    `product_id` BIGINT NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_details` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `img1` VARCHAR(191) NOT NULL,
    `img2` VARCHAR(191) NOT NULL,
    `img3` VARCHAR(191) NOT NULL,
    `img4` VARCHAR(191) NOT NULL,
    `des` LONGTEXT NOT NULL,
    `colot` CHAR(50) NOT NULL,
    `size` CHAR(20) NOT NULL,
    `product_id` BIGINT NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `product_details_product_id_key`(`product_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `product_sliders` ADD CONSTRAINT `product_sliders_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_details` ADD CONSTRAINT `product_details_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
