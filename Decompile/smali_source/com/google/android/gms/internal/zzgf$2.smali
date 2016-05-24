.class Lcom/google/android/gms/internal/zzgf$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgf;->zzd(Lorg/json/JSONObject;)Lcom/google/android/gms/internal/zzgf$zza;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzDb:Lcom/google/android/gms/internal/zzgf;

.field final synthetic zzDc:Lcom/google/android/gms/internal/zzie;

.field final synthetic zzDd:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgf;Lcom/google/android/gms/internal/zzie;Ljava/lang/String;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgf$2;->zzDb:Lcom/google/android/gms/internal/zzgf;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgf$2;->zzDc:Lcom/google/android/gms/internal/zzie;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgf$2;->zzDd:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgf$2;->zzDc:Lcom/google/android/gms/internal/zzie;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgf$2;->zzDb:Lcom/google/android/gms/internal/zzgf;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzgf;->zza(Lcom/google/android/gms/internal/zzgf;)Lcom/google/android/gms/ads/internal/zzn;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/ads/internal/zzn;->zzbq()Lcom/google/android/gms/internal/zzlh;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgf$2;->zzDd:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzlh;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzie;->zzf(Ljava/lang/Object;)V

    return-void
.end method
