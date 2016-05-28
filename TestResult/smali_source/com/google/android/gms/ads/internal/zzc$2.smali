.class Lcom/google/android/gms/ads/internal/zzc$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/zzc;->zza(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzcd;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzoA:Lcom/google/android/gms/internal/zzhj$zza;

.field final synthetic zzoB:Lcom/google/android/gms/ads/internal/zzc;

.field final synthetic zzoC:Lcom/google/android/gms/internal/zzcd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/zzc;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzcd;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoA:Lcom/google/android/gms/internal/zzhj$zza;

    iput-object p3, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoC:Lcom/google/android/gms/internal/zzcd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoA:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEg:Z

    if-eqz v0, :cond_4b

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqu:Lcom/google/android/gms/internal/zzch;

    if-eqz v0, :cond_4b

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoA:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzAT:Ljava/lang/String;

    if-eqz v1, :cond_27

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoA:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzAT:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhu;->zzaw(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_27
    new-instance v1, Lcom/google/android/gms/internal/zzce;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoA:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v3, v3, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->body:Ljava/lang/String;

    invoke-direct {v1, v2, v0, v3}, Lcom/google/android/gms/internal/zzce;-><init>(Lcom/google/android/gms/ads/internal/zzg;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    const/4 v2, 0x1

    iput v2, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqz:I

    :try_start_3b
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqu:Lcom/google/android/gms/internal/zzch;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzch;->zza(Lcom/google/android/gms/internal/zzcg;)V
    :try_end_44
    .catch Landroid/os/RemoteException; {:try_start_3b .. :try_end_44} :catch_45

    :goto_44
    return-void

    :catch_45
    move-exception v0

    const-string v1, "Could not call the onCustomRenderedAdLoadedListener."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_4b
    new-instance v0, Lcom/google/android/gms/ads/internal/zze;

    invoke-direct {v0}, Lcom/google/android/gms/ads/internal/zze;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoA:Lcom/google/android/gms/internal/zzhj$zza;

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/ads/internal/zzc;->zza(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/ads/internal/zze;)Lcom/google/android/gms/internal/zzip;

    move-result-object v5

    new-instance v1, Lcom/google/android/gms/ads/internal/zze$zzb;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoA:Lcom/google/android/gms/internal/zzhj$zza;

    invoke-direct {v1, v2, v5}, Lcom/google/android/gms/ads/internal/zze$zzb;-><init>(Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzip;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/internal/zze;->zza(Lcom/google/android/gms/ads/internal/zze$zza;)V

    new-instance v1, Lcom/google/android/gms/ads/internal/zzc$2$1;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/ads/internal/zzc$2$1;-><init>(Lcom/google/android/gms/ads/internal/zzc$2;Lcom/google/android/gms/ads/internal/zze;)V

    invoke-interface {v5, v1}, Lcom/google/android/gms/internal/zzip;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v1, Lcom/google/android/gms/ads/internal/zzc$2$2;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/ads/internal/zzc$2$2;-><init>(Lcom/google/android/gms/ads/internal/zzc$2;Lcom/google/android/gms/ads/internal/zze;)V

    invoke-interface {v5, v1}, Lcom/google/android/gms/internal/zzip;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v0, v0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    const/4 v1, 0x0

    iput v1, v0, Lcom/google/android/gms/ads/internal/zzq;->zzqz:I

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v9, v0, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbw()Lcom/google/android/gms/internal/zzga;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/zzq;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v3, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoA:Lcom/google/android/gms/internal/zzhj$zza;

    iget-object v4, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzc;->zzos:Lcom/google/android/gms/ads/internal/zzq;

    iget-object v4, v4, Lcom/google/android/gms/ads/internal/zzq;->zzqa:Lcom/google/android/gms/internal/zzan;

    iget-object v6, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v6, v6, Lcom/google/android/gms/ads/internal/zzc;->zzow:Lcom/google/android/gms/internal/zzeh;

    iget-object v7, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoB:Lcom/google/android/gms/ads/internal/zzc;

    iget-object v8, p0, Lcom/google/android/gms/ads/internal/zzc$2;->zzoC:Lcom/google/android/gms/internal/zzcd;

    invoke-virtual/range {v0 .. v8}, Lcom/google/android/gms/internal/zzga;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/zza;Lcom/google/android/gms/internal/zzhj$zza;Lcom/google/android/gms/internal/zzan;Lcom/google/android/gms/internal/zzip;Lcom/google/android/gms/internal/zzeh;Lcom/google/android/gms/internal/zzga$zza;Lcom/google/android/gms/internal/zzcd;)Lcom/google/android/gms/internal/zzhq;

    move-result-object v0

    iput-object v0, v9, Lcom/google/android/gms/ads/internal/zzq;->zzqe:Lcom/google/android/gms/internal/zzhq;

    goto :goto_44
.end method
