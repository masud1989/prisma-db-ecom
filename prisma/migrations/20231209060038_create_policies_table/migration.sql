-- CreateTable
CREATE TABLE `policies` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `type` ENUM('Return', 'Exchange') NOT NULL,
    `des` LONGTEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
