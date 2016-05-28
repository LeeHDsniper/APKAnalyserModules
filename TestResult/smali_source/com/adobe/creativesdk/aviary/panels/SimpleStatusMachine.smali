.class public Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;
.super Ljava/lang/Object;
.source "SimpleStatusMachine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;
    }
.end annotation


# instance fields
.field private currentStatus:I

.field private mStatusListener:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;

.field private previousStatus:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, -0x1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->currentStatus:I

    .line 6
    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->previousStatus:I

    .line 36
    return-void
.end method


# virtual methods
.method public getCurrentStatus()I
    .registers 2

    .prologue
    .line 29
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->currentStatus:I

    return v0
.end method

.method public getPreviousStatus()I
    .registers 2

    .prologue
    .line 33
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->previousStatus:I

    return v0
.end method

.method public setOnStatusChangeListener(Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;

    .prologue
    .line 10
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->mStatusListener:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;

    .line 11
    return-void
.end method

.method public setStatus(I)V
    .registers 5
    .param p1, "newStatus"    # I

    .prologue
    .line 14
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->currentStatus:I

    if-eq p1, v0, :cond_18

    .line 15
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->currentStatus:I

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->previousStatus:I

    .line 16
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->currentStatus:I

    .line 18
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->mStatusListener:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;

    if-eqz v0, :cond_17

    .line 19
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->mStatusListener:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->previousStatus:I

    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->currentStatus:I

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;->onStatusChanged(II)V

    .line 26
    :cond_17
    :goto_17
    return-void

    .line 22
    :cond_18
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->mStatusListener:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;

    if-eqz v0, :cond_17

    .line 23
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine;->mStatusListener:Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/aviary/panels/SimpleStatusMachine$OnStatusChangeListener;->onStatusUpdated(I)V

    goto :goto_17
.end method
