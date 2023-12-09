-- CreateTable
CREATE TABLE `invoices` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `total` CHAR(20) NOT NULL,
    `vat` CHAR(20) NOT NULL,
    `payable` CHAR(20) NOT NULL,
    `cus_details` CHAR(50) NOT NULL,
    `ship_details` CHAR(50) NOT NULL,
    `tran_id` CHAR(50) NOT NULL,
    `val_id` CHAR(50) NOT NULL,
    `delivery_status` ENUM('Processed', 'Not_Delivered', 'Delivered') NOT NULL,
    `payment_status` CHAR(20) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
