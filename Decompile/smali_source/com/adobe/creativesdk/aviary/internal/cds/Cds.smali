.class public final Lcom/adobe/creativesdk/aviary/internal/cds/Cds;
.super Ljava/lang/Object;
.source "Cds.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;,
        Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;,
        Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;,
        Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;,
        Lcom/adobe/creativesdk/aviary/internal/cds/Cds$MessageType;
    }
.end annotation


# direct methods
.method private static getOverlayFilename(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;)Ljava/lang/String;
    .registers 4
    .param p0, "identifier"    # Ljava/lang/String;
    .param p1, "size"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    .prologue
    .line 93
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$Size:[I

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_4a

    .line 101
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 95
    :pswitch_d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-large.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 97
    :pswitch_21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-medium.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 99
    :pswitch_35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-small.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 93
    nop

    :pswitch_data_4a
    .packed-switch 0x1
        :pswitch_d
        :pswitch_21
        :pswitch_35
    .end packed-switch
.end method

.method public static getPackItemFilename(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;)Ljava/lang/String;
    .registers 5
    .param p0, "identifier"    # Ljava/lang/String;
    .param p1, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .param p2, "size"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    .prologue
    .line 69
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$PackType:[I

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_18

    .line 75
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 71
    :pswitch_d
    invoke-static {p0, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds;->getStickerFilename(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;)Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 73
    :pswitch_12
    invoke-static {p0, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds;->getOverlayFilename(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;)Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 69
    nop

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_d
        :pswitch_12
    .end packed-switch
.end method

.method public static getPreviewItemExt(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Ljava/lang/String;
    .registers 2
    .param p0, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 53
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-ne p0, v0, :cond_7

    .line 54
    const-string v0, ".jpg"

    .line 56
    :goto_6
    return-object v0

    :cond_7
    const-string v0, ".png"

    goto :goto_6
.end method

.method public static getPreviewItemExt(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "packType"    # Ljava/lang/String;

    .prologue
    .line 61
    const-string v0, "effect"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 62
    const-string v0, ".jpg"

    .line 64
    :goto_a
    return-object v0

    :cond_b
    const-string v0, ".png"

    goto :goto_a
.end method

.method private static getStickerFilename(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;)Ljava/lang/String;
    .registers 4
    .param p0, "identifier"    # Ljava/lang/String;
    .param p1, "size"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    .prologue
    .line 80
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$Size:[I

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_4a

    .line 88
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 82
    :pswitch_d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-large.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 84
    :pswitch_21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-medium.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 86
    :pswitch_35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-small.png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 80
    nop

    :pswitch_data_4a
    .packed-switch 0x1
        :pswitch_d
        :pswitch_21
        :pswitch_35
    .end packed-switch
.end method
