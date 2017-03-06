
 PARAMETER VERSION = 2.2.0


BEGIN OS
 PARAMETER OS_NAME = device_tree
 PARAMETER PROC_INSTANCE = ps7_cortexa9_0
 PARAMETER console_device = axi_uartlite_0
 PARAMETER main_memory = axi_emc_0
END


BEGIN PROCESSOR
 PARAMETER DRIVER_NAME = cpu_cortexa9
 PARAMETER HW_INSTANCE = ps7_cortexa9_0
END


BEGIN DRIVER
 PARAMETER DRIVER_NAME = axi_emc
 PARAMETER HW_INSTANCE = axi_emc_0
 PARAMETER bank-width = 4
 PARAMETER reg = 0x60000000 0x2000000
 PARAMETER xlnx,axi-clk-period-ps = 20000
 PARAMETER xlnx,include-datawidth-matching-0 = 0
 PARAMETER xlnx,include-datawidth-matching-1 = 1
 PARAMETER xlnx,include-datawidth-matching-2 = 1
 PARAMETER xlnx,include-datawidth-matching-3 = 1
 PARAMETER xlnx,include-negedge-ioregs = 0
 PARAMETER xlnx,lflash-period-ps = 20000
 PARAMETER xlnx,linear-flash-sync-burst = 0
 PARAMETER xlnx,max-mem-width = 32
 PARAMETER xlnx,mem-a-lsb = 0
 PARAMETER xlnx,mem-a-msb = 31
 PARAMETER xlnx,mem0-type = 1
 PARAMETER xlnx,mem0-width = 32
 PARAMETER xlnx,mem1-type = 0
 PARAMETER xlnx,mem1-width = 16
 PARAMETER xlnx,mem2-type = 0
 PARAMETER xlnx,mem2-width = 16
 PARAMETER xlnx,mem3-type = 0
 PARAMETER xlnx,mem3-width = 16
 PARAMETER xlnx,num-banks-mem = 1
 PARAMETER xlnx,page-size = 16
 PARAMETER xlnx,parity-type-mem-0 = 0
 PARAMETER xlnx,parity-type-mem-1 = 0
 PARAMETER xlnx,parity-type-mem-2 = 0
 PARAMETER xlnx,parity-type-mem-3 = 0
 PARAMETER xlnx,port-diff = 0
 PARAMETER xlnx,s-axi-en-reg = 0
 PARAMETER xlnx,s-axi-mem-addr-width = 32
 PARAMETER xlnx,s-axi-mem-data-width = 32
 PARAMETER xlnx,s-axi-mem-id-width = 1
 PARAMETER xlnx,s-axi-reg-addr-width = 5
 PARAMETER xlnx,s-axi-reg-data-width = 32
 PARAMETER xlnx,synch-pipedelay-0 = 1
 PARAMETER xlnx,synch-pipedelay-1 = 1
 PARAMETER xlnx,synch-pipedelay-2 = 1
 PARAMETER xlnx,synch-pipedelay-3 = 1
 PARAMETER xlnx,tavdv-ps-mem-0 = 15000
 PARAMETER xlnx,tavdv-ps-mem-1 = 15000
 PARAMETER xlnx,tavdv-ps-mem-2 = 15000
 PARAMETER xlnx,tavdv-ps-mem-3 = 15000
 PARAMETER xlnx,tcedv-ps-mem-0 = 15000
 PARAMETER xlnx,tcedv-ps-mem-1 = 15000
 PARAMETER xlnx,tcedv-ps-mem-2 = 15000
 PARAMETER xlnx,tcedv-ps-mem-3 = 15000
 PARAMETER xlnx,thzce-ps-mem-0 = 7000
 PARAMETER xlnx,thzce-ps-mem-1 = 7000
 PARAMETER xlnx,thzce-ps-mem-2 = 7000
 PARAMETER xlnx,thzce-ps-mem-3 = 7000
 PARAMETER xlnx,thzoe-ps-mem-0 = 7000
 PARAMETER xlnx,thzoe-ps-mem-1 = 7000
 PARAMETER xlnx,thzoe-ps-mem-2 = 7000
 PARAMETER xlnx,thzoe-ps-mem-3 = 7000
 PARAMETER xlnx,tlzwe-ps-mem-0 = 0
 PARAMETER xlnx,tlzwe-ps-mem-1 = 0
 PARAMETER xlnx,tlzwe-ps-mem-2 = 0
 PARAMETER xlnx,tlzwe-ps-mem-3 = 0
 PARAMETER xlnx,tpacc-ps-flash-0 = 25000
 PARAMETER xlnx,tpacc-ps-flash-1 = 25000
 PARAMETER xlnx,tpacc-ps-flash-2 = 25000
 PARAMETER xlnx,tpacc-ps-flash-3 = 25000
 PARAMETER xlnx,twc-ps-mem-0 = 15000
 PARAMETER xlnx,twc-ps-mem-1 = 15000
 PARAMETER xlnx,twc-ps-mem-2 = 15000
 PARAMETER xlnx,twc-ps-mem-3 = 15000
 PARAMETER xlnx,twp-ps-mem-0 = 12000
 PARAMETER xlnx,twp-ps-mem-1 = 12000
 PARAMETER xlnx,twp-ps-mem-2 = 12000
 PARAMETER xlnx,twp-ps-mem-3 = 12000
 PARAMETER xlnx,twph-ps-mem-0 = 12000
 PARAMETER xlnx,twph-ps-mem-1 = 12000
 PARAMETER xlnx,twph-ps-mem-2 = 12000
 PARAMETER xlnx,twph-ps-mem-3 = 12000
 PARAMETER xlnx,use-startup = 0
 PARAMETER xlnx,use-startup-int = 0
 PARAMETER xlnx,wr-rec-time-mem-0 = 27000
 PARAMETER xlnx,wr-rec-time-mem-1 = 27000
 PARAMETER xlnx,wr-rec-time-mem-2 = 27000
 PARAMETER xlnx,wr-rec-time-mem-3 = 27000
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpio
 PARAMETER HW_INSTANCE = axi_gpio_0
 PARAMETER reg = 0x41200000 0x10000
 PARAMETER xlnx,all-inputs = 0
 PARAMETER xlnx,all-inputs-2 = 0
 PARAMETER xlnx,all-outputs = 0
 PARAMETER xlnx,all-outputs-2 = 0
 PARAMETER xlnx,dout-default = 0x00000000
 PARAMETER xlnx,dout-default-2 = 0x00000000
 PARAMETER xlnx,gpio-width = 32
 PARAMETER xlnx,gpio2-width = 32
 PARAMETER xlnx,interrupt-present = 0
 PARAMETER xlnx,is-dual = 0
 PARAMETER xlnx,tri-default = 0xFFFFFFFF
 PARAMETER xlnx,tri-default-2 = 0xFFFFFFFF
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpio
 PARAMETER HW_INSTANCE = axi_gpio_1
 PARAMETER reg = 0x41210000 0x10000
 PARAMETER xlnx,all-inputs = 0
 PARAMETER xlnx,all-inputs-2 = 0
 PARAMETER xlnx,all-outputs = 0
 PARAMETER xlnx,all-outputs-2 = 0
 PARAMETER xlnx,dout-default = 0x00000000
 PARAMETER xlnx,dout-default-2 = 0x00000000
 PARAMETER xlnx,gpio-width = 6
 PARAMETER xlnx,gpio2-width = 32
 PARAMETER xlnx,interrupt-present = 0
 PARAMETER xlnx,is-dual = 0
 PARAMETER xlnx,tri-default = 0xFFFFFFFF
 PARAMETER xlnx,tri-default-2 = 0xFFFFFFFF
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpio
 PARAMETER HW_INSTANCE = axi_gpio_2
 PARAMETER reg = 0x41220000 0x10000
 PARAMETER xlnx,all-inputs = 0
 PARAMETER xlnx,all-inputs-2 = 0
 PARAMETER xlnx,all-outputs = 0
 PARAMETER xlnx,all-outputs-2 = 0
 PARAMETER xlnx,dout-default = 0x00000000
 PARAMETER xlnx,dout-default-2 = 0x00000000
 PARAMETER xlnx,gpio-width = 32
 PARAMETER xlnx,gpio2-width = 32
 PARAMETER xlnx,interrupt-present = 0
 PARAMETER xlnx,is-dual = 0
 PARAMETER xlnx,tri-default = 0xFFFFFFFF
 PARAMETER xlnx,tri-default-2 = 0xFFFFFFFF
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = uartlite
 PARAMETER HW_INSTANCE = axi_uartlite_0
 PARAMETER clock-names = ref_clk
 PARAMETER clocks = clkc 0
 PARAMETER interrupt-parent = intc
 PARAMETER interrupts = 0 29 1
 PARAMETER reg = 0x42c00000 0x10000
 PARAMETER xlnx,baudrate = 115200
 PARAMETER xlnx,data-bits = 8
 PARAMETER xlnx,odd-parity = 0
 PARAMETER xlnx,s-axi-aclk-freq-hz-d = 50.0
 PARAMETER xlnx,use-parity = 0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = axi_clk_wiz
 PARAMETER HW_INSTANCE = clk_wiz_0
 PARAMETER clock-output-names = clk_out1 clk_out2
 PARAMETER reg = 0x43c00000 0x10000
 PARAMETER speed-grade = (-1)
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_afi_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_afi_1
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_afi_2
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_afi_3
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_coresight_comp_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = ddrps
 PARAMETER HW_INSTANCE = ps7_ddr_0
 PARAMETER reg = 0x0 0x20000000
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = ddrcps
 PARAMETER HW_INSTANCE = ps7_ddrc_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = devcfg
 PARAMETER HW_INSTANCE = ps7_dev_cfg_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = none
 PARAMETER HW_INSTANCE = ps7_dma_ns
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = dmaps
 PARAMETER HW_INSTANCE = ps7_dma_s
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = emacps
 PARAMETER HW_INSTANCE = ps7_ethernet_0
 PARAMETER phy-mode = rgmii-id
 PARAMETER xlnx,ptp-enet-clock = 111111115
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = globaltimerps
 PARAMETER HW_INSTANCE = ps7_globaltimer_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpiops
 PARAMETER HW_INSTANCE = ps7_gpio_0
 PARAMETER emio-gpio-width = 3
 PARAMETER gpio-mask-high = 0
 PARAMETER gpio-mask-low = 22016
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_gpv_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_intc_dist_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_iop_bus_config_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_l2cachec_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = ocmcps
 PARAMETER HW_INSTANCE = ps7_ocmc_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = pl310ps
 PARAMETER HW_INSTANCE = ps7_pl310_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = pmups
 PARAMETER HW_INSTANCE = ps7_pmu_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = ramps
 PARAMETER HW_INSTANCE = ps7_ram_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = none
 PARAMETER HW_INSTANCE = ps7_ram_1
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_scuc_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = scugic
 PARAMETER HW_INSTANCE = ps7_scugic_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = scutimer
 PARAMETER HW_INSTANCE = ps7_scutimer_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = scuwdt
 PARAMETER HW_INSTANCE = ps7_scuwdt_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = generic
 PARAMETER HW_INSTANCE = ps7_sd_0
 PARAMETER xlnx,has-cd = 0
 PARAMETER xlnx,has-power = 0
 PARAMETER xlnx,has-wp = 0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = slcrps
 PARAMETER HW_INSTANCE = ps7_slcr_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = spips
 PARAMETER HW_INSTANCE = ps7_spi_0
 PARAMETER num-cs = 3
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = uartps
 PARAMETER HW_INSTANCE = ps7_uart_0
 PARAMETER port-number = 2
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = uartps
 PARAMETER HW_INSTANCE = ps7_uart_1
 PARAMETER port-number = 3
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = usbps
 PARAMETER HW_INSTANCE = ps7_usb_0
 PARAMETER phy_type = ulpi
 PARAMETER usb-reset = gpio0 49 0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = xadcps
 PARAMETER HW_INSTANCE = ps7_xadc_0
END


