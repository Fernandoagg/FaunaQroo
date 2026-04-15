-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `species` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `common_name` VARCHAR(191) NOT NULL,
    `scientific_name` VARCHAR(191) NOT NULL,
    `group` VARCHAR(191) NOT NULL,
    `image_url` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sightings` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `quantity` INTEGER NOT NULL DEFAULT 1,
    `latitude` DOUBLE NOT NULL,
    `longitude` DOUBLE NOT NULL,
    `observed_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `status` VARCHAR(191) NOT NULL DEFAULT 'vivo',
    `notes` VARCHAR(191) NULL,
    `photo_path` VARCHAR(191) NULL,
    `species_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `sightings` ADD CONSTRAINT `sightings_species_id_fkey` FOREIGN KEY (`species_id`) REFERENCES `species`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
