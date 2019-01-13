# SPDX-License-Identifier: GPL-2.0
dtb-$(CONFIG_MACH_EXYNOS7885_A7Y18LTE_EUR_OPEN) := \
	exynos/exynos7885-a7y18lte_eur_open_00.dtb \
	exynos/exynos7885-a7y18lte_eur_open_01.dtb \
	exynos/exynos7885-a7y18lte_eur_open_03.dtb

targets += dtbs
DTB_LIST  := $(dtb-y) $(dtbo-y)
always    := $(DTB_LIST)

dtbs: $(addprefix $(obj)/, $(DTB_LIST))

clean-files := *.dtb*
