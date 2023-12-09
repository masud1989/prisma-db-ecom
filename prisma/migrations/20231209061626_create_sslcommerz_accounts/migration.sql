-- CreateTable
CREATE TABLE `sslcommerz_accounts` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `store_id` VARCHAR(191) NOT NULL,
    `store_password` VARCHAR(191) NOT NULL,
    `currency` CHAR(50) NOT NULL,
    `success_url` CHAR(50) NOT NULL,
    `fail_url` CHAR(50) NOT NULL,
    `cancel_url` CHAR(50) NOT NULL,
    `ipn_url` CHAR(50) NOT NULL,
    `init_url` CHAR(50) NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
