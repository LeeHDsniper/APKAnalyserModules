.class public abstract Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;
.super Ljava/lang/Exception;
.source "AdobeImageInitializationException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException$AdobeImageInvalidContextException;,
        Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException$AdobeImageInvalidApiKeyException;
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 17
    return-void
.end method

.method public static fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;
    .registers 2
    .param p0, "code"    # I

    .prologue
    const/4 v0, 0x0

    .line 32
    packed-switch p0, :pswitch_data_12

    .line 40
    :goto_4
    :pswitch_4
    return-object v0

    .line 36
    :pswitch_5
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException$AdobeImageInvalidContextException;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException$AdobeImageInvalidContextException;-><init>()V

    goto :goto_4

    .line 38
    :pswitch_b
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException$AdobeImageInvalidApiKeyException;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException$AdobeImageInvalidApiKeyException;-><init>()V

    goto :goto_4

    .line 32
    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_4
        :pswitch_5
        :pswitch_b
    .end packed-switch
.end method
