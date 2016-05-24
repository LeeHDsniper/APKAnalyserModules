.class Lcom/google/android/gms/internal/zzqk$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzqq;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzqk;->zza(Lcom/google/android/gms/internal/zzqi;Lcom/google/android/gms/internal/zzqk$zza;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaTB:Lcom/google/android/gms/internal/zzqi;

.field final synthetic zzaTC:Lcom/google/android/gms/internal/zzqk$zza;

.field final synthetic zzaTD:Lcom/google/android/gms/internal/zzqk;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzqk;Lcom/google/android/gms/internal/zzqi;Lcom/google/android/gms/internal/zzqk$zza;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqk$1;->zzaTD:Lcom/google/android/gms/internal/zzqk;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzqk$1;->zzaTB:Lcom/google/android/gms/internal/zzqi;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzqk$1;->zzaTC:Lcom/google/android/gms/internal/zzqk$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;Ljava/lang/Integer;J)V
    .registers 14

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_28

    sget-object v0, Lcom/google/android/gms/internal/zzqr;->zzaUg:Ljava/lang/Integer;

    if-ne p3, v0, :cond_25

    sget-object v5, Lcom/google/android/gms/internal/zzqo$zza$zza;->zzaTQ:Lcom/google/android/gms/internal/zzqo$zza$zza;

    :goto_d
    new-instance v0, Lcom/google/android/gms/internal/zzqo$zza;

    sget-object v1, Lcom/google/android/gms/common/api/Status;->zzaaD:Lcom/google/android/gms/common/api/Status;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzqk$1;->zzaTB:Lcom/google/android/gms/internal/zzqi;

    move-object v4, p2

    check-cast v4, Lcom/google/android/gms/internal/zzqp$zzc;

    move-wide v6, p4

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzqo$zza;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/internal/zzqi;[BLcom/google/android/gms/internal/zzqp$zzc;Lcom/google/android/gms/internal/zzqo$zza$zza;J)V

    :goto_1a
    iget-object v1, p0, Lcom/google/android/gms/internal/zzqk$1;->zzaTC:Lcom/google/android/gms/internal/zzqk$zza;

    new-instance v2, Lcom/google/android/gms/internal/zzqo;

    invoke-direct {v2, v0}, Lcom/google/android/gms/internal/zzqo;-><init>(Lcom/google/android/gms/internal/zzqo$zza;)V

    invoke-interface {v1, v2}, Lcom/google/android/gms/internal/zzqk$zza;->zza(Lcom/google/android/gms/internal/zzqo;)V

    return-void

    :cond_25
    sget-object v5, Lcom/google/android/gms/internal/zzqo$zza$zza;->zzaTP:Lcom/google/android/gms/internal/zzqo$zza$zza;

    goto :goto_d

    :cond_28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "There is no valid resource for the container: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqk$1;->zzaTB:Lcom/google/android/gms/internal/zzqi;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqi;->getContainerId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v0, Lcom/google/android/gms/internal/zzqo$zza;

    new-instance v2, Lcom/google/android/gms/common/api/Status;

    const/16 v4, 0x10

    invoke-direct {v2, v4, v1}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    sget-object v1, Lcom/google/android/gms/internal/zzqo$zza$zza;->zzaTP:Lcom/google/android/gms/internal/zzqo$zza$zza;

    invoke-direct {v0, v2, v3, v1}, Lcom/google/android/gms/internal/zzqo$zza;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/internal/zzqi;Lcom/google/android/gms/internal/zzqo$zza$zza;)V

    goto :goto_1a
.end method
