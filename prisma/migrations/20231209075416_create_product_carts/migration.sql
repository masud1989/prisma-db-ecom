/*
  Warnings:

  - You are about to drop the column `colot` on the `product_details` table. All the data in the column will be lost.
  - Added the required column `color` to the `product_details` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `product_details` DROP COLUMN `colot`,
    ADD COLUMN `color` CHAR(50) NOT NULL;

-- CreateTable
CREATE TABLE `product_carts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `product_id` BIGINT NOT NULL,
    `color` CHAR(50) NOT NULL,
    `size` CHAR(20) NOT NULL,
    `qty` CHAR(20) NOT NULL,
    `price` CHAR(20) NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `product_carts_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `product_carts` ADD CONSTRAINT `product_carts_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_carts` ADD CONSTRAINT `product_carts_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
