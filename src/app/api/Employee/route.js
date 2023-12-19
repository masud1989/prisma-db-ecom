import { PrismaClient } from "@prisma/client";
import { NextResponse } from "next/server";

// Add the 3 Lines Below To Show Data when find
BigInt.prototype.toJSON = function () {
  const int = Number.parseInt(this.toString());
  return int ?? this.toString();
};

// Create Employee
export async function POST(req, res) {
  try {
    const Prisma = new PrismaClient();
    const reqBody = await req.json();
    const result = await Prisma.employees.create({
      data: reqBody,
    });
    // const result = await Prisma.employees.createMany({
    //     data : reqBody
    // })
    return NextResponse.json({ status: "success", data: reqBody });
  } catch (error) {
    return NextResponse.json({ status: "fail", data: error });
  }
}

// Update Employee
export async function PUT(req, res) {
  try {
    const Prisma = new PrismaClient();

    const result = await Prisma.employees.update({
      where: { id: 32 },
      data: {
        name: "Hasan",
        city: "Gazipur",
      },
    });

    return NextResponse.json({ status: "Data Update Success" });
  } catch (error) {
    return NextResponse.json({ status: "fail", data: error });
  }
}

// Update Employee
export async function DELETE(req, res) {
  try {
    const Prisma = new PrismaClient();

    const result = await Prisma.employees.delete({
      where: { id: 41 },
    });

    return NextResponse.json({ status: "Data Deleted Successful.." });
  } catch (error) {
    return NextResponse.json({ status: "fail", data: error });
  }
}

// Get All Employee
// export async function GET() {
//   try {
//     const Prisma = new PrismaClient();

//     const result = await Prisma.employees.findMany(
//       {where: {city: "Dhaka", salary: {lt:100000, gt:70000 }}} ,
//       {select: {name:true, city:true, salary:true }}
//     );

//     return NextResponse.json({
//       status: "success",
//       Total: result.length,
//       data: result,
//     });
//   } catch (error) {
//     return NextResponse.json({ status: "fail", msg: error.toString() });
//   }
// }



//Group By
// export async function GET() {
//     try {
//       const Prisma = new PrismaClient();
  
//       const result = await Prisma.employees.groupBy({
//         by:['city'], 
//         _count: {id: true},
//        _sum: {salary:true},
//        _avg: {salary: true},
//        _max: {salary: true},
//        _min: {salary: true}
//       });
  
//       return NextResponse.json({status: "success",  data: result });
//     } 
//     catch (error) {
//       return NextResponse.json({ status: "fail", msg: error.toString() });
//     }
//   }


// Aggregate 
// export async function GET(){
//   try {
//     const Prisma = new PrismaClient()

//     const result = await Prisma.employees.aggregate({
      
//       _avg: {
//         salary: true,
//       },
//       where: {
//         city: 'Dhaka',
//       },
//       orderBy: {
//         id: 'asc',
//       },
//       take: 10,
      
//     })


//     return NextResponse.json({status: "success",  data: result });
//   } 
//   catch (error) {
//     return NextResponse.json({ status: "fail", msg: error.toString() });
//   }
// }


// pagination/take/skip
export async function GET() {
    try {
      const Prisma = new PrismaClient();
  
      const result = await Prisma.employees.findMany(
          {
            select: {name:true, city:true, salary:true },
            where : {city : 'Dhaka'},
            skip: 3,
            take: 5,
          }
        );
  
      return NextResponse.json({status: "success", Total: result.length, data: result });

    } 
    catch (error) {
      return NextResponse.json({ status: "fail", msg: error.toString() });
    }
  }