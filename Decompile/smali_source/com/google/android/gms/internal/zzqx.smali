.class public abstract Lcom/google/android/gms/internal/zzqx;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzqx$zzb;,
        Lcom/google/android/gms/internal/zzqx$zza;
    }
.end annotation


# instance fields
.field private zzaUo:Lcom/google/android/gms/internal/zzqn;

.field private zzaUp:Lcom/google/android/gms/internal/zzql;

.field private zzpO:Lcom/google/android/gms/internal/zzlm;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzql;)V
    .registers 4

    invoke-static {}, Lcom/google/android/gms/internal/zzlo;->zzpN()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/gms/internal/zzqx;-><init>(Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzql;Lcom/google/android/gms/internal/zzlm;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzql;Lcom/google/android/gms/internal/zzlm;)V
    .registers 6

    const/4 v0, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqn;->zzBv()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v0, :cond_18

    :goto_e
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzZ(Z)V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqx;->zzaUo:Lcom/google/android/gms/internal/zzqn;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzqx;->zzaUp:Lcom/google/android/gms/internal/zzql;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzqx;->zzpO:Lcom/google/android/gms/internal/zzlm;

    return-void

    :cond_18
    const/4 v0, 0x0

    goto :goto_e
.end method


# virtual methods
.method protected abstract zza(Lcom/google/android/gms/internal/zzqi;)Lcom/google/android/gms/internal/zzqx$zzb;
.end method

.method protected abstract zza(Lcom/google/android/gms/internal/zzqo;)V
.end method

.method public zza(Lcom/google/android/gms/internal/zzqx$zza;)V
    .registers 10

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ResourceManager: Failed to download a resource: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqx$zza;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqx;->zzaUo:Lcom/google/android/gms/internal/zzqn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqn;->zzBv()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzqi;

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/zzqx;->zza(Lcom/google/android/gms/internal/zzqi;)Lcom/google/android/gms/internal/zzqx$zzb;

    move-result-object v6

    if-eqz v6, :cond_54

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzqx$zzb;->zzBX()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/google/android/gms/internal/zzqp$zzc;

    if-eqz v0, :cond_54

    new-instance v0, Lcom/google/android/gms/internal/zzqo$zza;

    sget-object v1, Lcom/google/android/gms/common/api/Status;->zzaaD:Lcom/google/android/gms/common/api/Status;

    const/4 v3, 0x0

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzqx$zzb;->zzBX()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/zzqp$zzc;

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzqx$zzb;->zzBx()Lcom/google/android/gms/internal/zzqo$zza$zza;

    move-result-object v5

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzqx$zzb;->zzBB()J

    move-result-wide v6

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzqo$zza;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/internal/zzqi;[BLcom/google/android/gms/internal/zzqp$zzc;Lcom/google/android/gms/internal/zzqo$zza$zza;J)V

    :goto_4b
    new-instance v1, Lcom/google/android/gms/internal/zzqo;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/zzqo;-><init>(Lcom/google/android/gms/internal/zzqo$zza;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzqx;->zza(Lcom/google/android/gms/internal/zzqo;)V

    return-void

    :cond_54
    new-instance v0, Lcom/google/android/gms/internal/zzqo$zza;

    sget-object v1, Lcom/google/android/gms/common/api/Status;->zzaaF:Lcom/google/android/gms/common/api/Status;

    sget-object v3, Lcom/google/android/gms/internal/zzqo$zza$zza;->zzaTO:Lcom/google/android/gms/internal/zzqo$zza$zza;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzqo$zza;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/internal/zzqi;Lcom/google/android/gms/internal/zzqo$zza$zza;)V

    goto :goto_4b
.end method

.method public zzu([B)V
    .registers 10

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ResourceManager: Resource downloaded from Network: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqx;->zzaUo:Lcom/google/android/gms/internal/zzqn;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqn;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqx;->zzaUo:Lcom/google/android/gms/internal/zzqn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqn;->zzBv()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzqi;

    sget-object v4, Lcom/google/android/gms/internal/zzqo$zza$zza;->zzaTO:Lcom/google/android/gms/internal/zzqo$zza$zza;

    const/4 v3, 0x0

    const-wide/16 v0, 0x0

    :try_start_2e
    iget-object v5, p0, Lcom/google/android/gms/internal/zzqx;->zzaUp:Lcom/google/android/gms/internal/zzql;

    invoke-interface {v5, p1}, Lcom/google/android/gms/internal/zzql;->zzt([B)Ljava/lang/Object;

    move-result-object v3

    iget-object v5, p0, Lcom/google/android/gms/internal/zzqx;->zzpO:Lcom/google/android/gms/internal/zzlm;

    invoke-interface {v5}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v0

    if-nez v3, :cond_53

    const-string v5, "Parsed resource from network is null"

    invoke-static {v5}, Lcom/google/android/gms/tagmanager/zzbg;->zzaD(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/zzqx;->zza(Lcom/google/android/gms/internal/zzqi;)Lcom/google/android/gms/internal/zzqx$zzb;

    move-result-object v5

    if-eqz v5, :cond_53

    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzqx$zzb;->zzBX()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzqx$zzb;->zzBx()Lcom/google/android/gms/internal/zzqo$zza$zza;

    move-result-object v4

    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzqx$zzb;->zzBB()J
    :try_end_52
    .catch Lcom/google/android/gms/internal/zzqp$zzg; {:try_start_2e .. :try_end_52} :catch_6b

    move-result-wide v0

    :cond_53
    move-wide v6, v0

    move-object v5, v4

    move-object v4, v3

    :goto_56
    if-eqz v4, :cond_83

    new-instance v0, Lcom/google/android/gms/internal/zzqo$zza;

    sget-object v1, Lcom/google/android/gms/common/api/Status;->zzaaD:Lcom/google/android/gms/common/api/Status;

    check-cast v4, Lcom/google/android/gms/internal/zzqp$zzc;

    move-object v3, p1

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzqo$zza;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/internal/zzqi;[BLcom/google/android/gms/internal/zzqp$zzc;Lcom/google/android/gms/internal/zzqo$zza$zza;J)V

    :goto_62
    new-instance v1, Lcom/google/android/gms/internal/zzqo;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/zzqo;-><init>(Lcom/google/android/gms/internal/zzqo$zza;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzqx;->zza(Lcom/google/android/gms/internal/zzqo;)V

    return-void

    :catch_6b
    move-exception v5

    const-string v5, "Resource from network is corrupted"

    invoke-static {v5}, Lcom/google/android/gms/tagmanager/zzbg;->zzaD(Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/zzqx;->zza(Lcom/google/android/gms/internal/zzqi;)Lcom/google/android/gms/internal/zzqx$zzb;

    move-result-object v5

    if-eqz v5, :cond_8d

    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzqx$zzb;->zzBX()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzqx$zzb;->zzBx()Lcom/google/android/gms/internal/zzqo$zza$zza;

    move-result-object v4

    move-wide v6, v0

    move-object v5, v4

    move-object v4, v3

    goto :goto_56

    :cond_83
    new-instance v0, Lcom/google/android/gms/internal/zzqo$zza;

    sget-object v1, Lcom/google/android/gms/common/api/Status;->zzaaF:Lcom/google/android/gms/common/api/Status;

    sget-object v3, Lcom/google/android/gms/internal/zzqo$zza$zza;->zzaTO:Lcom/google/android/gms/internal/zzqo$zza$zza;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzqo$zza;-><init>(Lcom/google/android/gms/common/api/Status;Lcom/google/android/gms/internal/zzqi;Lcom/google/android/gms/internal/zzqo$zza$zza;)V

    goto :goto_62

    :cond_8d
    move-wide v6, v0

    move-object v5, v4

    move-object v4, v3

    goto :goto_56
.end method
