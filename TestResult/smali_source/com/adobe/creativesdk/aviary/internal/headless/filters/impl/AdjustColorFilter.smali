.class public Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustColorFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustSliderFilter;
.source "AdjustColorFilter.java"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 16
    const-string v0, "adjustcolor"

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustSliderFilter;-><init>(Ljava/lang/String;)V

    .line 17
    return-void
.end method

.method public static getToolName(I)Ljava/lang/String;
    .registers 2
    .param p0, "position"    # I

    .prologue
    .line 20
    packed-switch p0, :pswitch_data_16

    .line 30
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 22
    :pswitch_9
    const-string v0, "saturation"

    .line 28
    :goto_b
    return-object v0

    .line 24
    :pswitch_c
    const-string v0, "warmth"

    goto :goto_b

    .line 26
    :pswitch_f
    const-string v0, "tint"

    goto :goto_b

    .line 28
    :pswitch_12
    const-string v0, "fade"

    goto :goto_b

    .line 20
    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_12
    .end packed-switch
.end method


# virtual methods
.method public setAdjustTool(ID)V
    .registers 8
    .param p1, "index"    # I
    .param p2, "value"    # D

    .prologue
    .line 36
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustColorFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 37
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    packed-switch p1, :pswitch_data_28

    .line 51
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1

    .line 39
    :pswitch_10
    const-string v1, "saturation"

    invoke-virtual {v0, v1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 53
    :goto_15
    return-void

    .line 42
    :pswitch_16
    const-string v1, "warmth"

    invoke-virtual {v0, v1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    goto :goto_15

    .line 45
    :pswitch_1c
    const-string v1, "tint"

    invoke-virtual {v0, v1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    goto :goto_15

    .line 48
    :pswitch_22
    const-string v1, "fade"

    invoke-virtual {v0, v1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    goto :goto_15

    .line 37
    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_10
        :pswitch_16
        :pswitch_1c
        :pswitch_22
    .end packed-switch
.end method
