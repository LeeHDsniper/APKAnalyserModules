.class Lcom/google/android/gms/internal/zzqk$zzb;
.super Lcom/google/android/gms/internal/zzqx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzqk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "zzb"
.end annotation


# instance fields
.field final synthetic zzaTD:Lcom/google/android/gms/internal/zzqk;

.field private final zzaTE:Lcom/google/android/gms/internal/zzqk$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzqk;Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzql;Lcom/google/android/gms/internal/zzqk$zza;)V
    .registers 5

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqk$zzb;->zzaTD:Lcom/google/android/gms/internal/zzqk;

    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/internal/zzqx;-><init>(Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzql;)V

    iput-object p4, p0, Lcom/google/android/gms/internal/zzqk$zzb;->zzaTE:Lcom/google/android/gms/internal/zzqk$zza;

    return-void
.end method


# virtual methods
.method protected zza(Lcom/google/android/gms/internal/zzqi;)Lcom/google/android/gms/internal/zzqx$zzb;
    .registers 3

    const/4 v0, 0x0

    return-object v0
.end method

.method protected zza(Lcom/google/android/gms/internal/zzqo;)V
    .registers 5

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqo;->zzBw()Lcom/google/android/gms/internal/zzqo$zza;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqk$zzb;->zzaTD:Lcom/google/android/gms/internal/zzqk;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzqk;->zza(Lcom/google/android/gms/internal/zzqo$zza;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqo$zza;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    sget-object v2, Lcom/google/android/gms/common/api/Status;->zzaaD:Lcom/google/android/gms/common/api/Status;

    if-ne v0, v2, :cond_46

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqo$zza;->zzBx()Lcom/google/android/gms/internal/zzqo$zza$zza;

    move-result-object v0

    sget-object v2, Lcom/google/android/gms/internal/zzqo$zza$zza;->zzaTO:Lcom/google/android/gms/internal/zzqo$zza$zza;

    if-ne v0, v2, :cond_46

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqo$zza;->zzBy()[B

    move-result-object v0

    if-eqz v0, :cond_46

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqo$zza;->zzBy()[B

    move-result-object v0

    array-length v0, v0

    if-lez v0, :cond_46

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqk$zzb;->zzaTD:Lcom/google/android/gms/internal/zzqk;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzqk;->zza(Lcom/google/android/gms/internal/zzqk;)Lcom/google/android/gms/internal/zzqr;

    move-result-object v0

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqo$zza;->zzBz()Lcom/google/android/gms/internal/zzqi;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzqi;->zzBr()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqo$zza;->zzBy()[B

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/internal/zzqr;->zze(Ljava/lang/String;[B)V

    const-string v0, "Resource successfully load from Network."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqk$zzb;->zzaTE:Lcom/google/android/gms/internal/zzqk$zza;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzqk$zza;->zza(Lcom/google/android/gms/internal/zzqo;)V

    :goto_45
    return-void

    :cond_46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Response status: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqo$zza;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_b7

    const-string v0, "SUCCESS"

    :goto_5d
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqo$zza;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_ab

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Response source: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqo$zza;->zzBx()Lcom/google/android/gms/internal/zzqo$zza$zza;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzqo$zza$zza;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Response size: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqo$zza;->zzBy()[B

    move-result-object v2

    array-length v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    :cond_ab
    iget-object v0, p0, Lcom/google/android/gms/internal/zzqk$zzb;->zzaTD:Lcom/google/android/gms/internal/zzqk;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqo$zza;->zzBz()Lcom/google/android/gms/internal/zzqi;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzqk$zzb;->zzaTE:Lcom/google/android/gms/internal/zzqk$zza;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzqk;->zza(Lcom/google/android/gms/internal/zzqi;Lcom/google/android/gms/internal/zzqk$zza;)V

    goto :goto_45

    :cond_b7
    const-string v0, "FAILURE"

    goto :goto_5d
.end method
