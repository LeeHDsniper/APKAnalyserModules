.class Lcom/google/android/gms/common/api/zzg$zza$1;
.super Lcom/google/android/gms/common/api/zzi$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/common/api/zzg$zza;->zza(Lcom/google/android/gms/common/ConnectionResult;Lcom/google/android/gms/signin/internal/AuthAccountResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzZM:Lcom/google/android/gms/common/api/zzg;

.field final synthetic zzZN:Lcom/google/android/gms/common/ConnectionResult;

.field final synthetic zzZO:Lcom/google/android/gms/common/api/zzg$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/zzg$zza;Lcom/google/android/gms/common/api/zzj;Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 5

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzg$zza$1;->zzZO:Lcom/google/android/gms/common/api/zzg$zza;

    iput-object p3, p0, Lcom/google/android/gms/common/api/zzg$zza$1;->zzZM:Lcom/google/android/gms/common/api/zzg;

    iput-object p4, p0, Lcom/google/android/gms/common/api/zzg$zza$1;->zzZN:Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p0, p2}, Lcom/google/android/gms/common/api/zzi$zzb;-><init>(Lcom/google/android/gms/common/api/zzj;)V

    return-void
.end method


# virtual methods
.method public zznn()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zza$1;->zzZM:Lcom/google/android/gms/common/api/zzg;

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg$zza$1;->zzZN:Lcom/google/android/gms/common/ConnectionResult;

    invoke-static {v0, v1}, Lcom/google/android/gms/common/api/zzg;->zzc(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method
