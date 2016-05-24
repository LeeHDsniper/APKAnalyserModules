.class Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$2;
.super Ljava/lang/Object;
.source "AdobeCommonCache.java"

# interfaces
.implements Ljava/io/FileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->removeDiskCachesOlderThan(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    .prologue
    .line 122
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 125
    invoke-virtual {p1}, Ljava/io/File;->isHidden()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
