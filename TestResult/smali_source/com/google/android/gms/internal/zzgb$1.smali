.class Lcom/google/android/gms/internal/zzgb$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgb;->zzh(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzCJ:Lcom/google/android/gms/internal/zzgb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgb;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgb$1;->zzCJ:Lcom/google/android/gms/internal/zzgb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb$1;->zzCJ:Lcom/google/android/gms/internal/zzgb;

    iget-object v6, v0, Lcom/google/android/gms/internal/zzgb;->zzpc:Ljava/lang/Object;

    monitor-enter v6

    :try_start_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb$1;->zzCJ:Lcom/google/android/gms/internal/zzgb;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgb;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->errorCode:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_10

    monitor-exit v6

    :goto_f
    return-void

    :cond_10
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb$1;->zzCJ:Lcom/google/android/gms/internal/zzgb;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgb;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzip;->zzgS()Lcom/google/android/gms/internal/zziq;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgb$1;->zzCJ:Lcom/google/android/gms/internal/zzgb;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zziq;->zza(Lcom/google/android/gms/internal/zziq$zza;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb$1;->zzCJ:Lcom/google/android/gms/internal/zzgb;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgb;->zzfp()V

    const-string v0, "Loading HTML in WebView."

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb$1;->zzCJ:Lcom/google/android/gms/internal/zzgb;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgb;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgb$1;->zzCJ:Lcom/google/android/gms/internal/zzgb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzgb;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzAT:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzhu;->zzaw(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgb$1;->zzCJ:Lcom/google/android/gms/internal/zzgb;

    iget-object v2, v2, Lcom/google/android/gms/internal/zzgb;->zzCG:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->body:Ljava/lang/String;

    const-string v3, "text/html"

    const-string v4, "UTF-8"

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzip;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v6

    goto :goto_f

    :catchall_49
    move-exception v0

    monitor-exit v6
    :try_end_4b
    .catchall {:try_start_5 .. :try_end_4b} :catchall_49

    throw v0
.end method
