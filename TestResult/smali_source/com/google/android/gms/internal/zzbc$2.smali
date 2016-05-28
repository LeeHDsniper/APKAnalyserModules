.class Lcom/google/android/gms/internal/zzbc$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzbb$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzbc;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzie;Lcom/google/android/gms/internal/zzan;)Lcom/google/android/gms/internal/zzbb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzrp:Lcom/google/android/gms/internal/zzie;

.field final synthetic zzrs:Lcom/google/android/gms/internal/zzbc;

.field final synthetic zzrt:Lcom/google/android/gms/internal/zzbb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzbc;Lcom/google/android/gms/internal/zzie;Lcom/google/android/gms/internal/zzbb;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzbc$2;->zzrs:Lcom/google/android/gms/internal/zzbc;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzbc$2;->zzrp:Lcom/google/android/gms/internal/zzie;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzbc$2;->zzrt:Lcom/google/android/gms/internal/zzbb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzcj()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzbc$2;->zzrp:Lcom/google/android/gms/internal/zzie;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzbc$2;->zzrt:Lcom/google/android/gms/internal/zzbb;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzie;->zzf(Ljava/lang/Object;)V

    return-void
.end method
