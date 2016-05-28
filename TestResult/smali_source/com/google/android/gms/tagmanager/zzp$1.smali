.class Lcom/google/android/gms/tagmanager/zzp$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzqk$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/tagmanager/zzp;->load(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaPs:Ljava/lang/String;

.field final synthetic zzaPt:Lcom/google/android/gms/tagmanager/zzp;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zzp;Ljava/lang/String;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPs:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzqo;)V
    .registers 13

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqo;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/common/api/Status;->zzaaD:Lcom/google/android/gms/common/api/Status;

    if-eq v0, v1, :cond_32

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Load request failed for the container "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzp;->zza(Lcom/google/android/gms/tagmanager/zzp;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    sget-object v2, Lcom/google/android/gms/common/api/Status;->zzaaF:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/tagmanager/zzp;->zzbg(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/tagmanager/ContainerHolder;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/zzp;->zza(Lcom/google/android/gms/common/api/Result;)V

    :goto_31
    return-void

    :cond_32
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqo;->zzBw()Lcom/google/android/gms/internal/zzqo$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqo$zza;->zzBA()Lcom/google/android/gms/internal/zzqp$zzc;

    move-result-object v6

    if-nez v6, :cond_55

    const-string v0, "Response doesn\'t have the requested container"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    new-instance v3, Lcom/google/android/gms/common/api/Status;

    const/16 v4, 0x8

    const/4 v5, 0x0

    invoke-direct {v3, v4, v0, v5}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;Landroid/app/PendingIntent;)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/tagmanager/zzp;->zzbg(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/tagmanager/ContainerHolder;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/tagmanager/zzp;->zza(Lcom/google/android/gms/common/api/Result;)V

    goto :goto_31

    :cond_55
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqo;->zzBw()Lcom/google/android/gms/internal/zzqo$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqo$zza;->zzBB()J

    move-result-wide v4

    iget-object v7, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    new-instance v8, Lcom/google/android/gms/tagmanager/zzo;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzp;->zzb(Lcom/google/android/gms/tagmanager/zzp;)Lcom/google/android/gms/tagmanager/TagManager;

    move-result-object v9

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzp;->zzc(Lcom/google/android/gms/tagmanager/zzp;)Landroid/os/Looper;

    move-result-object v10

    new-instance v0, Lcom/google/android/gms/tagmanager/Container;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzp;->zzd(Lcom/google/android/gms/tagmanager/zzp;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzp;->zzb(Lcom/google/android/gms/tagmanager/zzp;)Lcom/google/android/gms/tagmanager/TagManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/tagmanager/TagManager;->getDataLayer()Lcom/google/android/gms/tagmanager/DataLayer;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    invoke-static {v3}, Lcom/google/android/gms/tagmanager/zzp;->zza(Lcom/google/android/gms/tagmanager/zzp;)Ljava/lang/String;

    move-result-object v3

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/tagmanager/Container;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/DataLayer;Ljava/lang/String;JLcom/google/android/gms/internal/zzqp$zzc;)V

    new-instance v1, Lcom/google/android/gms/tagmanager/zzp$1$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/tagmanager/zzp$1$1;-><init>(Lcom/google/android/gms/tagmanager/zzp$1;)V

    invoke-direct {v8, v9, v10, v0, v1}, Lcom/google/android/gms/tagmanager/zzo;-><init>(Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/tagmanager/zzo$zza;)V

    invoke-static {v7, v8}, Lcom/google/android/gms/tagmanager/zzp;->zza(Lcom/google/android/gms/tagmanager/zzp;Lcom/google/android/gms/tagmanager/zzo;)Lcom/google/android/gms/tagmanager/zzo;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzp;->zzf(Lcom/google/android/gms/tagmanager/zzp;)Lcom/google/android/gms/tagmanager/zzo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/zzp;->zza(Lcom/google/android/gms/common/api/Result;)V

    goto :goto_31
.end method
