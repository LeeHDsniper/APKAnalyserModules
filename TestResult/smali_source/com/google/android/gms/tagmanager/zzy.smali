.class public Lcom/google/android/gms/tagmanager/zzy;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzbh;


# instance fields
.field private zzMQ:I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x5

    iput v0, p0, Lcom/google/android/gms/tagmanager/zzy;->zzMQ:I

    return-void
.end method


# virtual methods
.method public e(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    iget v0, p0, Lcom/google/android/gms/tagmanager/zzy;->zzMQ:I

    const/4 v1, 0x6

    if-gt v0, v1, :cond_a

    const-string v0, "GoogleTagManager"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    return-void
.end method

.method public v(Ljava/lang/String;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    iget v0, p0, Lcom/google/android/gms/tagmanager/zzy;->zzMQ:I

    const/4 v1, 0x2

    if-gt v0, v1, :cond_a

    const-string v0, "GoogleTagManager"

    invoke-static {v0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    return-void
.end method

.method public zzaC(Ljava/lang/String;)V
    .registers 4

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzy;->zzMQ:I

    const/4 v1, 0x3

    if-gt v0, v1, :cond_a

    const-string v0, "GoogleTagManager"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    return-void
.end method

.method public zzaD(Ljava/lang/String;)V
    .registers 4

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzy;->zzMQ:I

    const/4 v1, 0x4

    if-gt v0, v1, :cond_a

    const-string v0, "GoogleTagManager"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    return-void
.end method

.method public zzaE(Ljava/lang/String;)V
    .registers 4

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzy;->zzMQ:I

    const/4 v1, 0x5

    if-gt v0, v1, :cond_a

    const-string v0, "GoogleTagManager"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_a
    return-void
.end method

.method public zzb(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzy;->zzMQ:I

    const/4 v1, 0x6

    if-gt v0, v1, :cond_a

    const-string v0, "GoogleTagManager"

    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_a
    return-void
.end method

.method public zzd(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzy;->zzMQ:I

    const/4 v1, 0x5

    if-gt v0, v1, :cond_a

    const-string v0, "GoogleTagManager"

    invoke-static {v0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_a
    return-void
.end method
