.class Lcom/google/android/gms/tagmanager/zzby$zza;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzcx$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/tagmanager/zzby;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "zza"
.end annotation


# instance fields
.field final synthetic zzaQS:Lcom/google/android/gms/tagmanager/zzby;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zzby;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzby$zza;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/tagmanager/zzaq;)V
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzby$zza;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzaq;->zzAe()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/google/android/gms/tagmanager/zzby;->zza(Lcom/google/android/gms/tagmanager/zzby;J)V

    return-void
.end method

.method public zzb(Lcom/google/android/gms/tagmanager/zzaq;)V
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzby$zza;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzaq;->zzAe()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/google/android/gms/tagmanager/zzby;->zza(Lcom/google/android/gms/tagmanager/zzby;J)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Permanent failure dispatching hitId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzaq;->zzAe()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    return-void
.end method

.method public zzc(Lcom/google/android/gms/tagmanager/zzaq;)V
    .registers 8

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzaq;->zzAf()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_1e

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzby$zza;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzaq;->zzAe()J

    move-result-wide v2

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzby$zza;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzby;->zza(Lcom/google/android/gms/tagmanager/zzby;)Lcom/google/android/gms/internal/zzlm;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v0, v2, v3, v4, v5}, Lcom/google/android/gms/tagmanager/zzby;->zza(Lcom/google/android/gms/tagmanager/zzby;JJ)V

    :cond_1d
    :goto_1d
    return-void

    :cond_1e
    const-wide/32 v2, 0xdbba00

    add-long/2addr v0, v2

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzby$zza;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzby;->zza(Lcom/google/android/gms/tagmanager/zzby;)Lcom/google/android/gms/internal/zzlm;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_1d

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzby$zza;->zzaQS:Lcom/google/android/gms/tagmanager/zzby;

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzaq;->zzAe()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/google/android/gms/tagmanager/zzby;->zza(Lcom/google/android/gms/tagmanager/zzby;J)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Giving up on failed hitId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/tagmanager/zzaq;->zzAe()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    goto :goto_1d
.end method
