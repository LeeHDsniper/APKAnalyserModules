.class public final Lcom/google/android/gms/internal/zzax;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private final zzqH:Ljava/lang/String;

.field private final zzqI:Lorg/json/JSONObject;

.field private final zzqJ:Ljava/lang/String;

.field private final zzqK:Ljava/lang/String;

.field private final zzqL:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;Lorg/json/JSONObject;Z)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzIz:Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzax;->zzqK:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzax;->zzqI:Lorg/json/JSONObject;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzax;->zzqJ:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzax;->zzqH:Ljava/lang/String;

    iput-boolean p5, p0, Lcom/google/android/gms/internal/zzax;->zzqL:Z

    return-void
.end method


# virtual methods
.method public zzbU()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzax;->zzqH:Ljava/lang/String;

    return-object v0
.end method

.method public zzbV()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzax;->zzqK:Ljava/lang/String;

    return-object v0
.end method

.method public zzbW()Lorg/json/JSONObject;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzax;->zzqI:Lorg/json/JSONObject;

    return-object v0
.end method

.method public zzbX()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzax;->zzqJ:Ljava/lang/String;

    return-object v0
.end method

.method public zzbY()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzax;->zzqL:Z

    return v0
.end method
