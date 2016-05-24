.class public final Lcom/facebook/internal/FileLruCache$Limits;
.super Ljava/lang/Object;
.source "FileLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/internal/FileLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Limits"
.end annotation


# instance fields
.field private byteCount:I

.field private fileCount:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 560
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 568
    const/16 v0, 0x400

    iput v0, p0, Lcom/facebook/internal/FileLruCache$Limits;->fileCount:I

    .line 569
    const/high16 v0, 0x100000

    iput v0, p0, Lcom/facebook/internal/FileLruCache$Limits;->byteCount:I

    .line 570
    return-void
.end method


# virtual methods
.method getByteCount()I
    .registers 2

    .prologue
    .line 573
    iget v0, p0, Lcom/facebook/internal/FileLruCache$Limits;->byteCount:I

    return v0
.end method

.method getFileCount()I
    .registers 2

    .prologue
    .line 577
    iget v0, p0, Lcom/facebook/internal/FileLruCache$Limits;->fileCount:I

    return v0
.end method
