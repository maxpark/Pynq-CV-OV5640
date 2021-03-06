// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

/***************************** Include Files *********************************/
#include "xsubsample.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSubsample_CfgInitialize(XSubsample *InstancePtr, XSubsample_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axilites_BaseAddress = ConfigPtr->Axilites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSubsample_Start(XSubsample *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubsample_ReadReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_AP_CTRL) & 0x80;
    XSubsample_WriteReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSubsample_IsDone(XSubsample *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubsample_ReadReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSubsample_IsIdle(XSubsample *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubsample_ReadReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSubsample_IsReady(XSubsample *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubsample_ReadReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSubsample_EnableAutoRestart(XSubsample *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubsample_WriteReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_AP_CTRL, 0x80);
}

void XSubsample_DisableAutoRestart(XSubsample *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubsample_WriteReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_AP_CTRL, 0);
}

void XSubsample_Set_rows(XSubsample *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubsample_WriteReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_ROWS_DATA, Data);
}

u32 XSubsample_Get_rows(XSubsample *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubsample_ReadReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_ROWS_DATA);
    return Data;
}

void XSubsample_Set_cols(XSubsample *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubsample_WriteReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_COLS_DATA, Data);
}

u32 XSubsample_Get_cols(XSubsample *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSubsample_ReadReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_COLS_DATA);
    return Data;
}

void XSubsample_InterruptGlobalEnable(XSubsample *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubsample_WriteReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_GIE, 1);
}

void XSubsample_InterruptGlobalDisable(XSubsample *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubsample_WriteReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_GIE, 0);
}

void XSubsample_InterruptEnable(XSubsample *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSubsample_ReadReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_IER);
    XSubsample_WriteReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_IER, Register | Mask);
}

void XSubsample_InterruptDisable(XSubsample *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSubsample_ReadReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_IER);
    XSubsample_WriteReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_IER, Register & (~Mask));
}

void XSubsample_InterruptClear(XSubsample *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSubsample_WriteReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_ISR, Mask);
}

u32 XSubsample_InterruptGetEnabled(XSubsample *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSubsample_ReadReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_IER);
}

u32 XSubsample_InterruptGetStatus(XSubsample *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSubsample_ReadReg(InstancePtr->Axilites_BaseAddress, XSUBSAMPLE_AXILITES_ADDR_ISR);
}

