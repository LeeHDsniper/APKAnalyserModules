.class final Lcom/facebook/internal/FileLruCache$ModifiedFile;
.super Ljava/lang/Object;
.source "FileLruCache.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/FileLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ModifiedFile"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/facebook/internal/FileLruCache$ModifiedFile;",
        ">;"
    }
.end annotation


# instance fields
.field private final file:Ljava/io/File;

.field private final modified:J


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 603
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 604
    iput-object p1, p0, Lcom/facebook/internal/FileLruCache$ModifiedFile;->file:Ljava/io/File;

    .line 605
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/facebook/internal/FileLruCache$ModifiedFile;->modified:J

    .line 606
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/facebook/internal/FileLruCache$ModifiedFile;)I
    .registers 6
    .param p1, "another"    # Lcom/facebook/internal/FileLruCache$ModifiedFile;

    .prologue
    .line 618
    invoke-virtual {p0}, Lcom/facebook/internal/FileLruCache$ModifiedFile;->getModified()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/facebook/internal/FileLruCache$ModifiedFile;->getModified()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_e

    .line 619
    const/4 v0, -0x1

    .line 623
    :goto_d
    return v0

    .line 620
    :cond_e
    invoke-virtual {p0}, Lcom/facebook/internal/FileLruCache$ModifiedFile;->getModified()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/facebook/internal/FileLruCache$ModifiedFile;->getModified()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_1c

    .line 621
    const/4 v0, 0x1

    goto :goto_d

    .line 623
    :cond_1c
    invoke-virtual {p0}, Lcom/facebook/internal/FileLruCache$ModifiedFile;->getFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p1}, Lcom/facebook/internal/FileLruCache$ModifiedFile;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/File;->compareTo(Ljava/io/File;)I

    move-result v0

    goto :goto_d
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 1
    check-cast p1, Lcom/facebook/internal/FileLruCache$ModifiedFile;

    invoke-virtual {p0, p1}, Lcom/facebook/internal/FileLruCache$ModifiedFile;->compareTo(Lcom/facebook/internal/FileLruCache$ModifiedFile;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "another"    # Ljava/lang/Object;

    .prologue
    .line 630
    instance-of v0, p1, Lcom/facebook/internal/FileLruCache$ModifiedFile;

    if-eqz v0, :cond_e

    .line 631
    check-cast p1, Lcom/facebook/internal/FileLruCache$ModifiedFile;

    .end local p1    # "another":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/facebook/internal/FileLruCache$ModifiedFile;->compareTo(Lcom/facebook/internal/FileLruCache$ModifiedFile;)I

    move-result v0

    if-nez v0, :cond_e

    .line 629
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 609
    iget-object v0, p0, Lcom/facebook/internal/FileLruCache$ModifiedFile;->file:Ljava/io/File;

    return-object v0
.end method

.method getModified()J
    .registers 3

    .prologue
    .line 613
    iget-wide v0, p0, Lcom/facebook/internal/FileLruCache$ModifiedFile;->modified:J

    return-wide v0
.end method

.method public hashCode()I
    .registers 7

    .prologue
    .line 636
    const/16 v0, 0x1d

    .line 638
    .local v0, "result":I
    iget-object v1, p0, Lcom/facebook/internal/FileLruCache$ModifiedFile;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x431

    .line 639
    mul-int/lit8 v1, v0, 0x25

    iget-wide v2, p0, Lcom/facebook/internal/FileLruCache$ModifiedFile;->modified:J

    const-wide/32 v4, 0x7fffffff

    rem-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 641
    return v0
.end method
