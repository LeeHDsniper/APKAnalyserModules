.class public Lcom/adobe/creativesdk/foundation/internal/cache/AdobeInvalidCacheSettingsException;
.super Ljava/lang/RuntimeException;
.source "AdobeInvalidCacheSettingsException.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 24
    return-void
.end method
