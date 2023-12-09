/*
  Warnings:

  - A unique constraint covering the columns `[product_id]` on the table `product_sliders` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `product_sliders_product_id_key` ON `product_sliders`(`product_id`);
