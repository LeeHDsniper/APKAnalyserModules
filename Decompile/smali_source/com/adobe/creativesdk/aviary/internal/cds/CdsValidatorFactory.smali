.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory;
.super Ljava/lang/Object;
.source "CdsValidatorFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    }
.end annotation


# direct methods
.method public static create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    .registers 4
    .param p0, "contentType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;
    .param p1, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 41
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$ContentType:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1a

    .line 48
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 43
    :pswitch_d
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsPreviewValidator;

    invoke-direct {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsPreviewValidator;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V

    goto :goto_c

    .line 45
    :pswitch_13
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;

    invoke-direct {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V

    goto :goto_c

    .line 41
    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_d
        :pswitch_13
    .end packed-switch
.end method
