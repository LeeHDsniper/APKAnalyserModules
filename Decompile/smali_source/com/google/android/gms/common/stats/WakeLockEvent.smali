.class public final Lcom/google/android/gms/common/stats/WakeLockEvent;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/common/stats/WakeLockEvent;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mVersionCode:I

.field private final zzafS:Ljava/lang/String;

.field private final zzafT:I

.field private final zzafU:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final zzafV:Ljava/lang/String;

.field private zzafW:I

.field private final zzafX:Ljava/lang/String;

.field private final zzafY:Ljava/lang/String;

.field private final zzafZ:F

.field private final zzafj:J

.field private zzafk:I

.field private final zzafr:J

.field private zzaft:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/common/stats/zzg;

    invoke-direct {v0}, Lcom/google/android/gms/common/stats/zzg;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/stats/WakeLockEvent;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(IJILjava/lang/String;ILjava/util/List;Ljava/lang/String;JILjava/lang/String;Ljava/lang/String;F)V
    .registers 19
    .param p1, "versionCode"    # I
    .param p2, "timeMillis"    # J
    .param p4, "eventType"    # I
    .param p5, "wakelockName"    # Ljava/lang/String;
    .param p6, "wakelockType"    # I
    .param p8, "eventKey"    # Ljava/lang/String;
    .param p9, "elapsedRealtime"    # J
    .param p11, "deviceState"    # I
    .param p12, "secondaryWakeLockName"    # Ljava/lang/String;
    .param p13, "hostPackageName"    # Ljava/lang/String;
    .param p14, "beginPowerPercentage"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJI",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "JI",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "F)V"
        }
    .end annotation

    .prologue
    .local p7, "callingPackages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->mVersionCode:I

    iput-wide p2, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafj:J

    iput p4, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafk:I

    iput-object p5, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafS:Ljava/lang/String;

    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafX:Ljava/lang/String;

    iput p6, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafT:I

    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzaft:J

    iput-object p7, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafU:Ljava/util/List;

    iput-object p8, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafV:Ljava/lang/String;

    iput-wide p9, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafr:J

    iput p11, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafW:I

    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafY:Ljava/lang/String;

    move/from16 v0, p14

    iput v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafZ:F

    return-void
.end method

.method public constructor <init>(JILjava/lang/String;ILjava/util/List;Ljava/lang/String;JILjava/lang/String;Ljava/lang/String;F)V
    .registers 29
    .param p1, "timeMillis"    # J
    .param p3, "eventType"    # I
    .param p4, "wakelockName"    # Ljava/lang/String;
    .param p5, "wakelockType"    # I
    .param p7, "eventKey"    # Ljava/lang/String;
    .param p8, "elapsedRealtime"    # J
    .param p10, "deviceState"    # I
    .param p11, "secondaryWakeLockName"    # Ljava/lang/String;
    .param p12, "hostPackageName"    # Ljava/lang/String;
    .param p13, "beginPowerPercentage"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "JI",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "F)V"
        }
    .end annotation

    .prologue
    .local p6, "callingPackages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x1

    move-object v0, p0

    move-wide/from16 v2, p1

    move/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-wide/from16 v9, p8

    move/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    move/from16 v14, p13

    invoke-direct/range {v0 .. v14}, Lcom/google/android/gms/common/stats/WakeLockEvent;-><init>(IJILjava/lang/String;ILjava/util/List;Ljava/lang/String;JILjava/lang/String;Ljava/lang/String;F)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public getEventType()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafk:I

    return v0
.end method

.method public getTimeMillis()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafj:J

    return-wide v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/common/stats/zzg;->zza(Lcom/google/android/gms/common/stats/WakeLockEvent;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzpA()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafV:Ljava/lang/String;

    return-object v0
.end method

.method public zzpC()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafr:J

    return-wide v0
.end method

.method public zzpE()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafS:Ljava/lang/String;

    return-object v0
.end method

.method public zzpF()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafX:Ljava/lang/String;

    return-object v0
.end method

.method public zzpG()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafT:I

    return v0
.end method

.method public zzpH()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafU:Ljava/util/List;

    return-object v0
.end method

.method public zzpI()I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafW:I

    return v0
.end method

.method public zzpJ()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafY:Ljava/lang/String;

    return-object v0
.end method

.method public zzpK()F
    .registers 2

    iget v0, p0, Lcom/google/android/gms/common/stats/WakeLockEvent;->zzafZ:F

    return v0
.end method
