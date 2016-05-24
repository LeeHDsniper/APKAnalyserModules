.class Lcom/facebook/internal/FileLruCache$2;
.super Ljava/lang/Object;
.source "FileLruCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/internal/FileLruCache;->clearCache()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/internal/FileLruCache;

.field private final synthetic val$filesToDelete:[Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/facebook/internal/FileLruCache;[Ljava/io/File;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/internal/FileLruCache$2;->this$0:Lcom/facebook/internal/FileLruCache;

    iput-object p2, p0, Lcom/facebook/internal/FileLruCache$2;->val$filesToDelete:[Ljava/io/File;

    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 231
    iget-object v2, p0, Lcom/facebook/internal/FileLruCache$2;->val$filesToDelete:[Ljava/io/File;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_4
    if-lt v1, v3, :cond_7

    .line 234
    return-void

    .line 231
    :cond_7
    aget-object v0, v2, v1

    .line 232
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 231
    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method
