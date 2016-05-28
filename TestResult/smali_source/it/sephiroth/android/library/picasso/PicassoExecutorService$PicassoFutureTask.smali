.class final Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;
.super Ljava/util/concurrent/FutureTask;
.source "PicassoExecutorService.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/PicassoExecutorService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PicassoFutureTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/FutureTask",
        "<",
        "Lit/sephiroth/android/library/picasso/BitmapHunter;",
        ">;",
        "Ljava/lang/Comparable",
        "<",
        "Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;",
        ">;"
    }
.end annotation


# instance fields
.field private final hunter:Lit/sephiroth/android/library/picasso/BitmapHunter;


# direct methods
.method public constructor <init>(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    .registers 3
    .param p1, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;

    .prologue
    .line 100
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 101
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;->hunter:Lit/sephiroth/android/library/picasso/BitmapHunter;

    .line 102
    return-void
.end method


# virtual methods
.method public compareTo(Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;)I
    .registers 6
    .param p1, "other"    # Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;

    .prologue
    .line 106
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;->hunter:Lit/sephiroth/android/library/picasso/BitmapHunter;

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getPriority()Lit/sephiroth/android/library/picasso/Picasso$Priority;

    move-result-object v0

    .line 107
    .local v0, "p1":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    iget-object v2, p1, Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;->hunter:Lit/sephiroth/android/library/picasso/BitmapHunter;

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getPriority()Lit/sephiroth/android/library/picasso/Picasso$Priority;

    move-result-object v1

    .line 111
    .local v1, "p2":Lit/sephiroth/android/library/picasso/Picasso$Priority;
    if-ne v0, v1, :cond_18

    iget-object v2, p0, Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;->hunter:Lit/sephiroth/android/library/picasso/BitmapHunter;

    iget v2, v2, Lit/sephiroth/android/library/picasso/BitmapHunter;->sequence:I

    iget-object v3, p1, Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;->hunter:Lit/sephiroth/android/library/picasso/BitmapHunter;

    iget v3, v3, Lit/sephiroth/android/library/picasso/BitmapHunter;->sequence:I

    sub-int/2addr v2, v3

    :goto_17
    return v2

    :cond_18
    invoke-virtual {v1}, Lit/sephiroth/android/library/picasso/Picasso$Priority;->ordinal()I

    move-result v2

    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Picasso$Priority;->ordinal()I

    move-result v3

    sub-int/2addr v2, v3

    goto :goto_17
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 95
    check-cast p1, Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;

    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;->compareTo(Lit/sephiroth/android/library/picasso/PicassoExecutorService$PicassoFutureTask;)I

    move-result v0

    return v0
.end method
