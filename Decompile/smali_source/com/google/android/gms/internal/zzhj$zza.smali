.class public final Lcom/google/android/gms/internal/zzhj$zza;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzhj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation


# instance fields
.field public final errorCode:I

.field public final zzGF:Lorg/json/JSONObject;

.field public final zzGG:Lcom/google/android/gms/internal/zzea;

.field public final zzGI:J

.field public final zzGJ:J

.field public final zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

.field public final zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

.field public final zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/ads/internal/request/AdResponseParcel;Lcom/google/android/gms/internal/zzea;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;IJJLorg/json/JSONObject;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhj$zza;->zzGL:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzhj$zza;->zzGM:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzhj$zza;->zzGG:Lcom/google/android/gms/internal/zzea;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzhj$zza;->zzqf:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iput p5, p0, Lcom/google/android/gms/internal/zzhj$zza;->errorCode:I

    iput-wide p6, p0, Lcom/google/android/gms/internal/zzhj$zza;->zzGI:J

    iput-wide p8, p0, Lcom/google/android/gms/internal/zzhj$zza;->zzGJ:J

    iput-object p10, p0, Lcom/google/android/gms/internal/zzhj$zza;->zzGF:Lorg/json/JSONObject;

    return-void
.end method
