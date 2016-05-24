.class public Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
.super Ljava/lang/Exception;
.source "AdobeImageExecutionException.java"


# instance fields
.field private code:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "code"    # I

    .prologue
    .line 50
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 51
    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->code:I

    .line 52
    return-void
.end method

.method public static fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
    .registers 4
    .param p0, "code"    # I

    .prologue
    .line 78
    packed-switch p0, :pswitch_data_62

    .line 101
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    const-string v1, "Unknown error"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;-><init>(Ljava/lang/String;I)V

    :goto_c
    return-object v0

    .line 80
    :pswitch_d
    const/4 v0, 0x0

    goto :goto_c

    .line 82
    :pswitch_f
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    const-string v1, "File not found"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;-><init>(Ljava/lang/String;I)V

    goto :goto_c

    .line 84
    :pswitch_18
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    const-string v1, "File too large"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;-><init>(Ljava/lang/String;I)V

    goto :goto_c

    .line 86
    :pswitch_21
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    const-string v1, "File not loaded"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;-><init>(Ljava/lang/String;I)V

    goto :goto_c

    .line 88
    :pswitch_2a
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    const-string v1, "Invalid Context"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;-><init>(Ljava/lang/String;I)V

    goto :goto_c

    .line 90
    :pswitch_33
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    const-string v1, "File already loaded"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;-><init>(Ljava/lang/String;I)V

    goto :goto_c

    .line 92
    :pswitch_3c
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    const-string v1, "Decoder not found for the specified file"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;-><init>(Ljava/lang/String;I)V

    goto :goto_c

    .line 94
    :pswitch_45
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    const-string v1, "Encoder not found for the specified file"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;-><init>(Ljava/lang/String;I)V

    goto :goto_c

    .line 96
    :pswitch_4e
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    const-string v1, "Decode error"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;-><init>(Ljava/lang/String;I)V

    goto :goto_c

    .line 98
    :pswitch_58
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    const-string v1, "Encode error"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;-><init>(Ljava/lang/String;I)V

    goto :goto_c

    .line 78
    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_d
        :pswitch_f
        :pswitch_18
        :pswitch_21
        :pswitch_2a
        :pswitch_33
        :pswitch_3c
        :pswitch_45
        :pswitch_4e
        :pswitch_58
    .end packed-switch
.end method


# virtual methods
.method public getCode()I
    .registers 2

    .prologue
    .line 74
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->code:I

    return v0
.end method
