.class Lcom/google/android/gms/common/api/zzg$zze$1;
.super Lcom/google/android/gms/common/api/zzi$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/common/api/zzg$zze;->zznn()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzZU:Lcom/google/android/gms/common/ConnectionResult;

.field final synthetic zzZV:Lcom/google/android/gms/common/api/zzg$zze;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/zzg$zze;Lcom/google/android/gms/common/api/zzj;Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzg$zze$1;->zzZV:Lcom/google/android/gms/common/api/zzg$zze;

    iput-object p3, p0, Lcom/google/android/gms/common/api/zzg$zze$1;->zzZU:Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p0, p2}, Lcom/google/android/gms/common/api/zzi$zzb;-><init>(Lcom/google/android/gms/common/api/zzj;)V

    return-void
.end method


# virtual methods
.method public zznn()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zze$1;->zzZV:Lcom/google/android/gms/common/api/zzg$zze;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzg$zze;->zzZK:Lcom/google/android/gms/common/api/zzg;

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg$zze$1;->zzZU:Lcom/google/android/gms/common/ConnectionResult;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/api/zzg;->zza(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method
