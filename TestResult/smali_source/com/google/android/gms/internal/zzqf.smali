.class public final Lcom/google/android/gms/internal/zzqf;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzqf$1;,
        Lcom/google/android/gms/internal/zzqf$zza;
    }
.end annotation


# instance fields
.field private final zzaTm:Z

.field private final zzaTn:Z

.field private final zzaTo:Ljava/lang/String;

.field private final zztw:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzqf$zza;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/internal/zzqf$zza;->zza(Lcom/google/android/gms/internal/zzqf$zza;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqf;->zzaTo:Ljava/lang/String;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzqf$zza;->zzb(Lcom/google/android/gms/internal/zzqf$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzqf;->zzaTm:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzqf$zza;->zzc(Lcom/google/android/gms/internal/zzqf$zza;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzqf;->zzaTn:Z

    invoke-static {p1}, Lcom/google/android/gms/internal/zzqf$zza;->zzd(Lcom/google/android/gms/internal/zzqf$zza;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqf;->zztw:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zzqf$zza;Lcom/google/android/gms/internal/zzqf$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzqf;-><init>(Lcom/google/android/gms/internal/zzqf$zza;)V

    return-void
.end method


# virtual methods
.method public getTrackingId()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqf;->zztw:Ljava/lang/String;

    return-object v0
.end method

.method public zzBj()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqf;->zzaTo:Ljava/lang/String;

    return-object v0
.end method

.method public zzBk()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzqf;->zzaTm:Z

    return v0
.end method

.method public zzBl()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzqf;->zzaTn:Z

    return v0
.end method
