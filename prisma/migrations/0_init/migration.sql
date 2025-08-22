-- CreateTable
CREATE TABLE `client` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT (curtime()),
    `name` VARCHAR(55) NOT NULL,
    `cpf` VARCHAR(14) NOT NULL,
    `email` VARCHAR(55) NOT NULL,

    UNIQUE INDEX `cpf_UNIQUE`(`cpf`),
    UNIQUE INDEX `email_UNIQUE`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `event` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT (curtime()),
    `name` VARCHAR(55) NOT NULL,
    `capacity` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `user_id` INTEGER NOT NULL,

    INDEX `fk_event_user1_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `profile` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `profile` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sale` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT (curtime()),
    `user_id` INTEGER NOT NULL,
    `ticket_id` INTEGER NOT NULL,

    INDEX `fk_sale_ticket1_idx`(`ticket_id`),
    INDEX `fk_sale_user1_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sector` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT (curtime()),
    `name` VARCHAR(55) NOT NULL,
    `capacity` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `status` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `status` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ticket` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(20) NOT NULL,
    `event_id` INTEGER NOT NULL,
    `status_id` INTEGER NOT NULL,
    `client_id` INTEGER NOT NULL,
    `sector_id` INTEGER NOT NULL,

    UNIQUE INDEX `code_UNIQUE`(`code`),
    INDEX `fk_ticket_client1_idx`(`client_id`),
    INDEX `fk_ticket_event1_idx`(`event_id`),
    INDEX `fk_ticket_sector1_idx`(`sector_id`),
    INDEX `fk_ticket_status1_idx`(`status_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `totem` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT (curtime()),
    `user_id` INTEGER NOT NULL,
    `ticket_id` INTEGER NOT NULL,

    INDEX `fk_totem_ticket1_idx`(`ticket_id`),
    INDEX `fk_totem_user1_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT (curtime()),
    `name` VARCHAR(55) NOT NULL,
    `cpf` VARCHAR(14) NOT NULL,
    `email` VARCHAR(55) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `profile_id` INTEGER NOT NULL,

    UNIQUE INDEX `cpf_UNIQUE`(`cpf`),
    UNIQUE INDEX `email_UNIQUE`(`email`),
    INDEX `fk_user_profile_idx`(`profile_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `event` ADD CONSTRAINT `fk_event_user1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `sale` ADD CONSTRAINT `fk_sale_ticket1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `sale` ADD CONSTRAINT `fk_sale_user1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `ticket` ADD CONSTRAINT `fk_ticket_client1` FOREIGN KEY (`client_id`) REFERENCES `client`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `ticket` ADD CONSTRAINT `fk_ticket_event1` FOREIGN KEY (`event_id`) REFERENCES `event`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `ticket` ADD CONSTRAINT `fk_ticket_sector1` FOREIGN KEY (`sector_id`) REFERENCES `sector`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `ticket` ADD CONSTRAINT `fk_ticket_status1` FOREIGN KEY (`status_id`) REFERENCES `status`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `totem` ADD CONSTRAINT `fk_totem_ticket1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `totem` ADD CONSTRAINT `fk_totem_user1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `fk_user_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

