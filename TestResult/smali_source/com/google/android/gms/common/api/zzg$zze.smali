.class Lcom/google/android/gms/common/api/zzg$zze;
.super Lcom/google/android/gms/common/api/zzg$zzi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/zzg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zze"
.end annotation


# instance fields
.field final synthetic zzZK:Lcom/google/android/gms/common/api/zzg;

.field private final zzZT:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "Lcom/google/android/gms/common/api/GoogleApiClient$zza;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/zzg;Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api$zzb;",
            "Lcom/google/android/gms/common/api/GoogleApiClient$zza;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzg$zze;->zzZK:Lcom/google/android/gms/common/api/zzg;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/common/api/zzg$zzi;-><init>(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/api/zzg$1;)V

    iput-object p2, p0, Lcom/google/android/gms/common/api/zzg$zze;->zzZT:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public zznn()V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zze;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zzb(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg$zze;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v1}, Lcom/google/android/gms/common/api/zzg;->zza(Lcom/google/android/gms/common/api/zzg;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    if-eqz v0, :cond_29

    new-instance v1, Lcom/google/android/gms/common/ConnectionResult;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zze;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zzd(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/common/api/zzi;

    move-result-object v0

    new-instance v2, Lcom/google/android/gms/common/api/zzg$zze$1;

    iget-object v3, p0, Lcom/google/android/gms/common/api/zzg$zze;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-direct {v2, p0, v3, v1}, Lcom/google/android/gms/common/api/zzg$zze$1;-><init>(Lcom/google/android/gms/common/api/zzg$zze;Lcom/google/android/gms/common/api/zzj;Lcom/google/android/gms/common/ConnectionResult;)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi$zzb;)V

    :cond_28
    return-void

    :cond_29
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zze;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zze(Lcom/google/android/gms/common/api/zzg;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zze;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zzf(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/signin/zzd;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/signin/zzd;->connect()V

    :cond_3a
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zze;->zzZT:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_44
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Api$zzb;

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg$zze;->zzZT:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/api/GoogleApiClient$zza;

    invoke-interface {v0, v1}, Lcom/google/android/gms/common/api/Api$zzb;->zza(Lcom/google/android/gms/common/api/GoogleApiClient$zza;)V

    goto :goto_44
.end method
