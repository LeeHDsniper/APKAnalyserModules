.class Lcom/google/android/gms/internal/zzdh$zzc;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzdh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "zzc"
.end annotation


# instance fields
.field final synthetic zzwV:Lcom/google/android/gms/internal/zzdh;

.field private final zzxc:Lcom/google/android/gms/internal/zzdh$zzd;

.field private final zzxd:Z

.field private final zzxe:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzdh;ZLcom/google/android/gms/internal/zzdh$zzd;Ljava/lang/String;)V
    .registers 5

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdh$zzc;->zzwV:Lcom/google/android/gms/internal/zzdh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzdh$zzc;->zzxd:Z

    iput-object p3, p0, Lcom/google/android/gms/internal/zzdh$zzc;->zzxc:Lcom/google/android/gms/internal/zzdh$zzd;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzdh$zzc;->zzxe:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getReason()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdh$zzc;->zzxe:Ljava/lang/String;

    return-object v0
.end method

.method public isSuccess()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzdh$zzc;->zzxd:Z

    return v0
.end method

.method public zzdE()Lcom/google/android/gms/internal/zzdh$zzd;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdh$zzc;->zzxc:Lcom/google/android/gms/internal/zzdh$zzd;

    return-object v0
.end method
