.class public final Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException$AdobeImageInvalidApiKeyException;
.super Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;
.source "AdobeImageInitializationException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AdobeImageInvalidApiKeyException"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 21
    const-string v0, "Invalid API-KEY"

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;-><init>(Ljava/lang/String;)V

    .line 22
    return-void
.end method
